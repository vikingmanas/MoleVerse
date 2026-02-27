import Foundation
import simd

struct Molecule: Identifiable, Sendable, Hashable {
    let id: UUID
    let name: String
    let formula: String
    let description: String
    let category: MoleculeCategory
    
    let atoms: [Atom]
    let bonds: [Bond]
    
   
    let molarMass: Double
    let bondEnergy: Double
    let hybridization: String
    
    
    let funFact: String
    let historicContext: String
    let synthesisRoutes: [SynthesisRoute]
    
    
    let chemClass: String 
    
    init(
        id: UUID = UUID(),
        name: String,
        formula: String,
        description: String,
        category: MoleculeCategory,
        atoms: [Atom],
        bonds: [Bond],
        molarMass: Double,
        bondEnergy: Double,
        hybridization: String,
        funFact: String,
        historicContext: String,
        synthesisRoutes: [SynthesisRoute],
        chemClass: String = "General"
    ) {
        self.id = id
        self.name = name
        self.formula = formula
        self.description = description
        self.category = category
        self.atoms = atoms
        self.bonds = bonds
        self.molarMass = molarMass
        self.bondEnergy = bondEnergy
        self.hybridization = hybridization
        self.funFact = funFact
        self.historicContext = historicContext
        self.synthesisRoutes = synthesisRoutes
        self.chemClass = chemClass
    }
    
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Molecule, rhs: Molecule) -> Bool {
        return lhs.id == rhs.id
    }
}

enum MoleculeCategory: String, CaseIterable, Sendable {
    case organic = "Organic"
    case inorganic = "Inorganic"
    case pharmaceutical = "Pharmaceutical"
    case biomolecule = "Biomolecule"
}

struct Atom: Identifiable, Sendable {
    let id: UUID
    let element: Element
    let position: SIMD3<Float>
    
    init(element: Element, position: SIMD3<Float>) {
        self.id = UUID()
        self.element = element
        self.position = position
    }
}

struct Bond: Identifiable, Sendable {
    let id: UUID
    let atom1Index: Int
    let atom2Index: Int
    let order: Int 
    
    init(from: Int, to: Int, order: Int = 1) {
        self.id = UUID()
        self.atom1Index = from
        self.atom2Index = to
        self.order = order
    }
}

struct SynthesisRoute: Identifiable, Sendable {
    let id: UUID
    let name: String
    let description: String
    let reactants: String
    let conditions: String
    
    init(name: String, description: String, reactants: String, conditions: String) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.reactants = reactants
        self.conditions = conditions
    }
}
