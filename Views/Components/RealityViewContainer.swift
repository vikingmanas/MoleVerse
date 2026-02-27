import SwiftUI
import RealityKit

struct RealityViewContainer: View {
    let molecule: Molecule

    @State private var cameraDistance: Float = 8.0
    @State private var orbitAngle: SIMD2<Float> = .zero
    @State private var lastDragValue: DragGesture.Value?

    @State private var shakeOffset: SIMD3<Float> = .zero

    @State private var motion = MotionManager()

    var body: some View {
        RealityView { content in

            let root = Entity()
            root.name = "Root"

            let camera = PerspectiveCamera()
            camera.position = [0, 0, cameraDistance]
            camera.look(at: .zero, from: [0, 0, cameraDistance], relativeTo: nil)

            let cameraAnchor = AnchorEntity(world: .zero)
            cameraAnchor.addChild(camera)
            cameraAnchor.name = "CameraAnchor"

            let lightEntity = Entity()
            var lightComponent = DirectionalLightComponent()
            lightComponent.color = .white
            lightComponent.intensity = 1200 
            lightEntity.components.set(lightComponent)
            lightEntity.look(at: .zero, from: [5, 5, 5], relativeTo: nil)

            let fillLight = Entity()
            var fillComponent = DirectionalLightComponent()
            fillComponent.color = .white
            fillComponent.intensity = 300 
            fillLight.components.set(fillComponent)
            fillLight.look(at: .zero, from: [-5, 5, -5], relativeTo: nil)

            root.addChild(lightEntity)
            root.addChild(fillLight)

            content.add(root)
            content.add(cameraAnchor)

            Task { @MainActor in
                loadMolecule(molecule, into: root)
            }

        } update: { content in
            guard let root = content.entities.first(where: { $0.name == "Root" }),
                  let cameraAnchor = content.entities.first(where: { $0.name == "CameraAnchor" }),
                  let camera = cameraAnchor.children.first as? PerspectiveCamera else { return }

            let totalPitch = orbitAngle.x + Float(motion.pitch)
            let totalYaw = orbitAngle.y + Float(motion.roll)

            let x = cameraDistance * sin(totalYaw) * cos(totalPitch)
            let y = cameraDistance * sin(totalPitch)
            let z = cameraDistance * cos(totalYaw) * cos(totalPitch)

            camera.position = [x, y, z]
            camera.look(at: .zero, from: [x, y, z], relativeTo: nil)

            if let container = root.children.first(where: { $0.name.starts(with: "MoleculeContainer") }) {
                container.position = shakeOffset
            }

            if root.children.first(where: { $0.name.starts(with: "MoleculeContainer") })?.name != "MoleculeContainer-\(molecule.id)" {
                root.children.removeAll(where: { $0.name.starts(with: "MoleculeContainer") })
                Task { @MainActor in
                    loadMolecule(molecule, into: root)
                }
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    let deltaX = Float(value.translation.width) * 0.01
                    let deltaY = Float(value.translation.height) * 0.01

                    if let last = lastDragValue {
                         let dx = Float(value.translation.width - last.translation.width) * 0.01
                         let dy = Float(value.translation.height - last.translation.height) * 0.01
                         orbitAngle.y -= dx
                         orbitAngle.x += dy

                         if abs(dx) > 0.01 || abs(dy) > 0.01 {
                             HapticManager.shared.playOrbitFeedback()
                         }
                    } else {

                        orbitAngle.y -= deltaX
                        orbitAngle.x += deltaY
                    }

                    orbitAngle.x = max(min(orbitAngle.x, 1.5), -1.5)

                    lastDragValue = value
                }
                .onEnded { _ in
                    lastDragValue = nil
                }
        )
        .gesture(
            MagnificationGesture()
                .onChanged { value in

                    let sensitivity: Float = 0.1
                    let delta = 1.0 - Float(value)
                    cameraDistance += delta * sensitivity
                    cameraDistance = max(2.0, min(cameraDistance, 15.0))
                }
        )
        .sensoryFeedback(.impact(weight: .heavy), trigger: motion.isShaking)
        .onChange(of: motion.isShaking) { _, shaking in
            if shaking {
                startVibration()
            } else {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    shakeOffset = .zero
                }
            }
        }
    }

    private func startVibration() {
        Task { @MainActor in
            let steps = 20
            for _ in 0..<steps {
                shakeOffset = SIMD3(
                    Float.random(in: -0.15...0.15),
                    Float.random(in: -0.15...0.15),
                    Float.random(in: -0.08...0.08)
                )
                try? await Task.sleep(nanoseconds: 40_000_000)
            }
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                shakeOffset = .zero
            }
        }
    }

    private func loadMolecule(_ molecule: Molecule, into root: Entity) {
        let container = Entity()
        container.name = "MoleculeContainer-\(molecule.id)"
        container.scale = [0.85, 0.85, 0.85]

        for atom in molecule.atoms {
            let sphere = MeshResource.generateSphere(radius: atom.element.radius)

            var material = PhysicallyBasedMaterial()
            material.baseColor = .init(tint: UIColor(atom.element.cpkColor))
            material.roughness = 0.15
            material.metallic = 0.1

            let atomEntity = ModelEntity(mesh: sphere, materials: [material])
            atomEntity.position = atom.position
            container.addChild(atomEntity)
        }

        for bond in molecule.bonds {
            guard bond.atom1Index < molecule.atoms.count,
                  bond.atom2Index < molecule.atoms.count else { continue }
            let atom1 = molecule.atoms[bond.atom1Index]
            let atom2 = molecule.atoms[bond.atom2Index]

            let start = atom1.position
            let end = atom2.position
            let length = distance(start, end)

            let cylinder = MeshResource.generateCylinder(height: length, radius: 0.08)

            let bondColor: UIColor
            switch bond.order {
            case 2: bondColor = .systemYellow
            case 3: bondColor = .systemCyan
            default: bondColor = .lightGray
            }

            var material = PhysicallyBasedMaterial()
            material.baseColor = .init(tint: bondColor)
            material.metallic = 0.8
            material.roughness = 0.3

            let bondEntity = ModelEntity(mesh: cylinder, materials: [material])
            bondEntity.position = (start + end) / 2

            let vector = end - start
            if length > 0.001 {
                let direction = normalize(vector)
                let yAxis = SIMD3<Float>(0, 1, 0)
                bondEntity.orientation = simd_quatf(from: yAxis, to: direction)
            }

            container.addChild(bondEntity)
        }

        root.addChild(container)
    }
}
