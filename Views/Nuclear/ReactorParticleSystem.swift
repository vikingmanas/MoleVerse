import SwiftUI

struct Particle {
    let id = UUID()
    let seedX: Double
    let seedY: Double
    let delay: Double
}

struct ReactorParticleSystem: View {
    let coreTemperature: Double

    @State private var particles: [Particle] = (0..<60).map { _ in 
        Particle(
            seedX: Double.random(in: 0...1), 
            seedY: Double.random(in: 0...1), 
            delay: Double.random(in: 0...2)
        ) 
    }

    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let now = timeline.date.timeIntervalSinceReferenceDate

                let intensity = max(0, min(1, (coreTemperature - 800) / 1000))
                if intensity <= 0 { return }

                for p in particles {

                    let lifecycle = (now + p.delay).truncatingRemainder(dividingBy: 2.0) / 2.0 

                    let spreadFactor = (p.seedX - 0.5) * 150 
                    let upwardSpeed = 250.0 + (p.seedY * 100.0)

                    let xOffset = spreadFactor * lifecycle
                    let yOffset = -(upwardSpeed * lifecycle * intensity)

                    let x = size.width / 2 + xOffset
                    let y = size.height / 2 + yOffset

                    let opacity = lifecycle < 0.1 ? (lifecycle / 0.1) : (1.0 - lifecycle)

                    let rectSize = 4.0 + (p.seedY * 6.0)
                    let rect = CGRect(x: x - rectSize/2, y: y - rectSize/2, width: rectSize, height: rectSize)

                    var color: Color = .red
                    if intensity > 0.8 && p.seedX > 0.7 {
                        color = .white
                    } else if intensity > 0.4 && p.seedX > 0.3 {
                        color = .orange
                    }

                    context.opacity = opacity * intensity

                    context.fill(Path(ellipseIn: rect), with: .color(color))

                    if rectSize > 6 {
                        context.opacity = opacity * intensity * 0.5
                        let glowRect = rect.insetBy(dx: -2, dy: -2)
                        context.fill(Path(ellipseIn: glowRect), with: .color(color))
                    }
                }
            }
        }
        .allowsHitTesting(false) 
    }
}
