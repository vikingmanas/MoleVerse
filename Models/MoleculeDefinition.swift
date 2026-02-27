import Foundation
import simd



typealias AtomBlueprint = (element: Element, position: SIMD3<Float>)
typealias BondBlueprint = (from: Int, to: Int, order: Int)

func A(_ element: Element, _ x: Float, _ y: Float, _ z: Float) -> AtomBlueprint {
    return (element, SIMD3(x, y, z))
}

func B(_ from: Int, _ to: Int, _ order: Int = 1) -> BondBlueprint {
    return (from, to, order)
}

struct MoleculeDefinition {
    let id: UUID = UUID()
    let name: String
    let formula: String
    let family: MolecularFamily
    let hybridization: Hybridization
    let bondType: BondType
    let molarMass: Double
    let bondEnergy: Double
    let atoms: [AtomBlueprint]
    let bonds: [BondBlueprint]
    let labMission: String
    let keyTakeaways: [String]
    
    let historicContext: HistoricContext
    let funFact: String
    let chemClass: String?
    let synthesisRoutes: [SynthesisRoute]

    internal init(name: String, formula: String, family: MolecularFamily, hybridization: Hybridization, bondType: BondType, molarMass: Double, bondEnergy: Double, atoms: [AtomBlueprint], bonds: [BondBlueprint], labMission: String, keyTakeaways: [String], historicContext: HistoricContext, funFact: String, synthesisRoutes: [SynthesisRoute] = [], chemClass: String? = nil) {
        self.name = name
        self.formula = formula
        self.family = family
        self.hybridization = hybridization
        self.bondType = bondType
        self.molarMass = molarMass
        self.bondEnergy = bondEnergy
        self.atoms = atoms
        self.bonds = bonds
        self.labMission = labMission
        self.keyTakeaways = keyTakeaways
        self.historicContext = historicContext
        self.funFact = funFact
        self.synthesisRoutes = synthesisRoutes
        self.chemClass = chemClass
    }
    
    func toMolecule() -> Molecule {
        
        let displayClass = chemClass ?? family.rawValue
        
        return Molecule(
            id: id,
            name: name,
            formula: formula,
            description: labMission,
            category: family.toCategory(),
            atoms: atoms.map { Atom(element: $0.element, position: $0.position) },
            bonds: bonds.map { Bond(from: $0.from, to: $0.to, order: $0.order) },
            molarMass: molarMass,
            bondEnergy: bondEnergy,
            hybridization: hybridization.rawValue,
            funFact: funFact,
            historicContext: historicContext.description,
            synthesisRoutes: synthesisRoutes, 
            chemClass: displayClass
        )
    }
}

enum MolecularFamily: String, Sendable {
    case cyclicHydrocarbon = "Cyclic Hydrocarbon"
    case aromatic = "Aromatic"
    case biomolecule = "Biomolecule"
    case neurotransmitter = "Neurotransmitter"
    case medicinal = "Medicinal"
    case highEnergy = "High Energy"
    case polymer = "Polymer Monomer"
    case inorganic = "Inorganic"
    
    func toCategory() -> MoleculeCategory {
        switch self {
        case .cyclicHydrocarbon, .aromatic, .polymer, .highEnergy: return .organic
        case .biomolecule, .neurotransmitter: return .biomolecule
        case .medicinal: return .pharmaceutical
        case .inorganic: return .inorganic
        }
    }
}

enum Hybridization: String, Sendable {
    case sp3 = "sp³"
    case sp2 = "sp²"
    case sp = "sp"
    case sp3d = "sp³d"
    case sp3d2 = "sp³d²"
    case complex = "Complex"
}

enum BondType: String, Sendable {
    case covalent = "Covalent"
    case ionic = "Ionic"
    case metallic = "Metallic"
    case hydrogen = "Hydrogen"
}

struct HistoricContext: Sendable {
    let discoverer: String
    let year: Int
    let impact: String
    
    var description: String {
        "Discovered by \(discoverer) in \(year). \(impact)"
    }
}
