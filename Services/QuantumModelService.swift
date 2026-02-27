import Foundation
import simd

actor QuantumModelService {

    struct AnalysisResult: Sendable {
        let stability: Double 
        let polarity: Double 
        let reactivity: Double 
        let description: String
    }

    func analyze(molecule: Molecule) async throws -> AnalysisResult {

        try await Task.sleep(for: .seconds(2.5))

        let stability = calculateStability(molecule)
        let polarity = calculatePolarity(molecule)
        let reactivity = calculateReactivity(molecule)

        return AnalysisResult(
            stability: stability,
            polarity: polarity,
            reactivity: reactivity,
            description: generateInsight(molecule, stability: stability)
        )
    }

    private func calculateStability(_ molecule: Molecule) -> Double {

        let totalBondEnergy = molecule.bondEnergy * Double(molecule.bonds.count)

        return -(totalBondEnergy / 10.0)
    }

    private func calculatePolarity(_ molecule: Molecule) -> Double {

        var centerOfMass: SIMD3<Float> = .zero
        var totalMass: Double = 0

        var centerOfEN: SIMD3<Float> = .zero
        var totalEN: Double = 0

        for atom in molecule.atoms {
            let mass = atom.element.atomicMass
            centerOfMass += atom.position * Float(mass)
            totalMass += mass

            let en = atom.element.electronegativity
            centerOfEN += atom.position * Float(en)
            totalEN += en
        }

        if totalMass > 0 { centerOfMass /= Float(totalMass) }
        if totalEN > 0 { centerOfEN /= Float(totalEN) }

        let diff = centerOfMass - centerOfEN
        let dist = sqrt(diff.x*diff.x + diff.y*diff.y + diff.z*diff.z)

        return Double(dist * 4.8) 
    }

    private func calculateReactivity(_ molecule: Molecule) -> Double {

        var baseGap = 10.0 

        let hasOxygen = molecule.atoms.contains { $0.element == .O }
        let hasNitrogen = molecule.atoms.contains { $0.element == .N }
        let hasDoubleBonds = molecule.bonds.contains { $0.order > 1 }

        if hasDoubleBonds { baseGap -= 3.0 }
        if hasOxygen { baseGap -= 1.5 }
        if hasNitrogen { baseGap -= 1.0 }

        return max(0.5, baseGap)
    }

    private func generateInsight(_ molecule: Molecule, stability: Double) -> String {
        if stability < -500 {
            return "Highly stable structure suitable for long-term storage."
        } else if molecule.category == .organic {
             return "Moderate reactivity; likely to participate in combustion."
        } else {
            return "Potential for energetic transformations detected."
        }
    }
}
