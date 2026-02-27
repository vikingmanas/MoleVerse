import Foundation
import simd

struct MoleculeDatabase {
    static let molecules: [Molecule] = [
        methane, ethane, propane, butane, pentane, hexane, heptane, octane, isooctane,
        ethene, propene, butene, butadiene, pentene1,
        ethyne, propyne, but1yne, but2yne, pentyne,
        methanol, ethanol, isopropanol, butanol, phenol,
        dimethylEther, diethylEther, thf, anisole, dioxane,
        formaldehyde, acetaldehyde, benzaldehyde, cinnamaldehyde, propionaldehyde,
        acetone, butanone, cyclohexanone, acetophenone, pentan2one,
        formicAcid, aceticAcid, propionicAcid, butyricAcid, citricAcid,
        benzene, toluene, naphthalene, anthracene, xylene,
        MoleculeDefinition(
            name: "Decane",
            formula: "C₁₀H₂₂",
            family: .highEnergy,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 142.29,
            bondEnergy: 390,
            atoms: [
            A(.C, -6.00, 0.00, 0.00),
            A(.C, -4.50, 0.80, 0.00),
            A(.C, -3.00, 0.00, 0.00),
            A(.C, -1.50, 0.80, 0.00),
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.50, 0.80, 0.00),
            A(.C, 3.00, 0.00, 0.00),
            A(.C, 4.50, 0.80, 0.00),
            A(.C, 6.00, 0.00, 0.00),
            A(.C, 7.50, 0.80, 0.00),
            A(.H, -6.79, 0.71, -0.22),
            A(.H, -5.99, -0.78, -0.76),
            A(.H, -6.18, -0.44, 0.98),
            A(.H, -4.50, 1.41, 0.90),
            A(.H, -4.50, 1.41, -0.90),
            A(.H, -3.00, -0.61, 0.90),
            A(.H, -3.00, -0.61, -0.90),
            A(.H, -1.50, 1.41, 0.90),
            A(.H, -1.50, 1.41, -0.90),
            A(.H, -0.00, -0.61, -0.90),
            A(.H, 0.00, -0.61, 0.90),
            A(.H, 1.50, 1.41, 0.90),
            A(.H, 1.50, 1.41, -0.90),
            A(.H, 3.00, -0.61, 0.90),
            A(.H, 3.00, -0.61, -0.90),
            A(.H, 4.50, 1.41, 0.90),
            A(.H, 4.50, 1.41, -0.90),
            A(.H, 6.00, -0.61, 0.90),
            A(.H, 6.00, -0.61, -0.90),
            A(.H, 8.30, 0.07, -0.13),
            A(.H, 7.53, 1.52, -0.82),
            A(.H, 7.63, 1.32, 0.95)
        ],
            bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 7), B(7, 8), 
            B(8, 9), B(0, 10), B(0, 11), B(0, 12), B(1, 13), B(1, 14), B(2, 15), B(2, 16), 
            B(3, 17), B(3, 18), B(4, 19), B(4, 20), B(5, 21), B(5, 22), B(6, 23), B(6, 24), 
            B(7, 25), B(7, 26), B(8, 27), B(8, 28), B(9, 29), B(9, 30), B(9, 31)
        ],
            labMission: "A heavy alkane liquid, sitting at the threshold of becoming a solid wax.",
            keyTakeaways: ["Component of gasoline", "Non-polar solvent", "High boiling point"],
            historicContext: HistoricContext(discoverer: "Petrochemical Industry", year: 1830, impact: "Standard for volatility testing."),
            funFact: "Decane has 75 isomeric structural forms.",
            synthesisRoutes: [
                SynthesisRoute(name: "Fractional Distillation", description: "Isolation from kerosene fraction of crude oil.", reactants: "Crude Oil", conditions: "Distillation")
            ],
            chemClass: "Alkanes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Hex-1-ene",
            formula: "C₆H₁₂",
            family: .polymer,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 84.16,
            bondEnergy: 600,
            atoms: [
            A(.C, -3.00, 0.00, 0.00),
            A(.C, -1.70, 0.80, 0.00),
            A(.C, -0.30, 0.00, 0.00),
            A(.C, 1.00, 0.80, 0.00),
            A(.C, 2.30, 0.00, 0.00),
            A(.C, 3.60, 0.80, 0.00),
            A(.H, -3.95, 0.50, -0.22),
            A(.H, -2.98, -1.07, 0.22),
            A(.H, -1.72, 1.89, 0.00),
            A(.H, -0.29, -0.62, 0.90),
            A(.H, -0.29, -0.62, -0.90),
            A(.H, 1.00, 1.42, 0.90),
            A(.H, 1.00, 1.42, -0.90),
            A(.H, 2.30, -0.62, -0.90),
            A(.H, 2.30, -0.62, 0.90),
            A(.H, 3.54, 1.59, 0.75),
            A(.H, 4.43, 0.14, 0.24),
            A(.H, 3.75, 1.24, -0.98)
        ],
            bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(0, 6), B(0, 7), B(1, 8), 
            B(2, 9), B(2, 10), B(3, 11), B(3, 12), B(4, 13), B(4, 14), B(5, 15), B(5, 16), 
            B(5, 17)
        ],
            labMission: "A liquid alpha-olefin used to make high-density polyethylene flexible.",
            keyTakeaways: ["Alpha olefin", "Polymer comonomer", "Liquid"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1880, impact: "Vital for modern plastics."),
            funFact: "It serves as a solvent for flavors and perfumes.",
            synthesisRoutes: [
                SynthesisRoute(name: "Oligomerization", description: "Shell Higher Olefin Process (SHOP).", reactants: "Ethylene", conditions: "Ni Catalyst")
            ],
            chemClass: "Alkenes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Hept-1-ene",
            formula: "C₇H₁₄",
            family: .polymer,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 98.19,
            bondEnergy: 605,
            atoms: [
            A(.C, -3.50, 0.00, 0.00),
            A(.C, -2.20, 0.80, 0.00),
            A(.C, -0.80, 0.00, 0.00),
            A(.C, 0.50, 0.80, 0.00),
            A(.C, 1.80, 0.00, 0.00),
            A(.C, 3.10, 0.80, 0.00),
            A(.C, 4.40, 0.00, 0.00),
            A(.H, -4.27, 0.20, 0.75),
            A(.H, -3.66, -0.78, -0.75),
            A(.H, -2.22, 1.89, 0.00),
            A(.H, -0.79, -0.62, -0.90),
            A(.H, -0.79, -0.62, 0.90),
            A(.H, 0.50, 1.42, -0.90),
            A(.H, 0.50, 1.42, 0.90),
            A(.H, 1.80, -0.62, -0.90),
            A(.H, 1.80, -0.62, 0.90),
            A(.H, 3.10, 1.42, -0.90),
            A(.H, 3.10, 1.42, 0.90),
            A(.H, 4.72, -0.17, 1.03),
            A(.H, 5.17, 0.56, -0.53),
            A(.H, 4.24, -0.96, -0.50)
        ],
            bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(0, 7), B(0, 8), 
            B(1, 9), B(2, 10), B(2, 11), B(3, 12), B(3, 13), B(4, 14), B(4, 15), B(5, 16), 
            B(5, 17), B(6, 18), B(6, 19), B(6, 20)
        ],
            labMission: "Another link in the chain of reactive olefins used in organic synthesis.",
            keyTakeaways: ["Alpha olefin", "Lubricant additive", "Liquid"],
            historicContext: HistoricContext(discoverer: "Industrial Era", year: 1950, impact: "Used in surfactant production."),
            funFact: "Used as a standard in chromatography.",
            synthesisRoutes: [
                SynthesisRoute(name: "Wax Cracking", description: "Thermal cracking of petroleum waxes.", reactants: "Paraffin Wax", conditions: "Heat")
            ],
            chemClass: "Alkenes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Oct-1-ene",
            formula: "C₈H₁₆",
            family: .polymer,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 112.21,
            bondEnergy: 610,
            atoms: [
            A(.C, -4.00, 0.00, 0.00),
            A(.C, -2.70, 0.80, 0.00),
            A(.C, -1.30, 0.00, 0.00),
            A(.C, 0.00, 0.80, 0.00),
            A(.C, 1.30, 0.00, 0.00),
            A(.C, 2.60, 0.80, 0.00),
            A(.C, 3.90, 0.00, 0.00),
            A(.C, 5.20, 0.80, 0.00),
            A(.H, -4.01, -1.02, 0.39),
            A(.H, -4.91, 0.44, -0.39),
            A(.H, -2.72, 1.89, 0.00),
            A(.H, -1.29, -0.62, -0.90),
            A(.H, -1.29, -0.62, 0.90),
            A(.H, -0.00, 1.42, 0.90),
            A(.H, 0.00, 1.42, -0.90),
            A(.H, 1.30, -0.62, -0.90),
            A(.H, 1.30, -0.62, 0.90),
            A(.H, 2.60, 1.42, -0.90),
            A(.H, 2.60, 1.42, 0.90),
            A(.H, 3.90, -0.62, -0.90),
            A(.H, 3.90, -0.62, 0.90),
            A(.H, 5.63, 0.79, 1.00),
            A(.H, 4.99, 1.83, -0.30),
            A(.H, 5.90, 0.35, -0.70)
        ],
            bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 7), B(0, 8), 
            B(0, 9), B(1, 10), B(2, 11), B(2, 12), B(3, 13), B(3, 14), B(4, 15), B(4, 16), 
            B(5, 17), B(5, 18), B(6, 19), B(6, 20), B(7, 21), B(7, 22), B(7, 23)
        ],
            labMission: "A long-chain olefin that imparts toughness to polyethylene plastics.",
            keyTakeaways: ["LLDPE comonomer", "Surfactant precursor", "Liquid"],
            historicContext: HistoricContext(discoverer: "Petrochemical Industry", year: 1960, impact: "Enables flexible plastic bags."),
            funFact: "It is the primary comonomer for Linear Low-Density Polyethylene (LLDPE).",
            synthesisRoutes: [
                SynthesisRoute(name: "Oligomerization", description: "Tetramerization of ethylene.", reactants: "4C₂H₄", conditions: "Cr Catalyst")
            ],
            chemClass: "Alkenes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Isoprene",
            formula: "C₅H₈",
            family: .polymer,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 68.12,
            bondEnergy: 600,
            atoms: [
            A(.C, -1.30, -0.70, 0.00),
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.30, -0.70, 0.00),
            A(.C, 2.60, 0.00, 0.00),
            A(.C, 0.00, 1.40, 0.00),
            A(.H, -2.15, -0.28, 0.54),
            A(.H, -1.41, -1.64, -0.54),
            A(.H, 1.30, -1.79, 0.00),
            A(.H, 3.13, 0.16, 0.94),
            A(.H, 3.03, 0.35, -0.94),
            A(.H, -0.51, 1.76, -0.89),
            A(.H, -0.52, 1.76, 0.89),
            A(.H, 1.03, 1.76, 0.01)
        ],
            bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(1, 4), B(0, 5), B(0, 6), B(2, 7), B(3, 8), 
            B(3, 9), B(4, 10), B(4, 11), B(4, 12)
        ],
            labMission: "The biological building block of terpenes and natural rubber.",
            keyTakeaways: ["Rubber monomer", "Terpene unit", "Volatile"],
            historicContext: HistoricContext(discoverer: "C.G. Williams", year: 1860, impact: "Isolated from destructive distillation of rubber."),
            funFact: "Trees emit isoprene, which can create a blue haze over forests.",
            synthesisRoutes: [
                SynthesisRoute(name: "Thermal Cracking", description: "Stream cracking of naphtha.", reactants: "Naphtha", conditions: "800°C")
            ],
            chemClass: "Alkenes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Cyclopentene",
            formula: "C₅H₈",
            family: .cyclicHydrocarbon,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 68.12,
            bondEnergy: 580,
            atoms: [
            A(.C, 0.00, 1.20, 0.00),
            A(.C, -1.10, 0.40, 0.00),
            A(.C, -0.70, -1.00, 0.00),
            A(.C, 0.70, -1.00, 0.00),
            A(.C, 1.10, 0.40, 0.00),
            A(.H, 0.00, 2.29, 0.00),
            A(.H, -2.13, 0.76, -0.00),
            A(.H, -1.08, -1.51, 0.89),
            A(.H, -1.08, -1.51, -0.89),
            A(.H, 1.08, -1.51, 0.89),
            A(.H, 1.08, -1.51, -0.89),
            A(.H, 1.69, 0.60, 0.89),
            A(.H, 1.69, 0.60, -0.89)
        ],
            bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3), B(3, 4), B(4, 0), B(0, 5), B(1, 6), B(2, 7), 
            B(2, 8), B(3, 9), B(3, 10), B(4, 11), B(4, 12)
        ],
            labMission: "A cyclic alkene used to create plasticizers and resins.",
            keyTakeaways: ["Cyclic alkene", "Reactive", "Monomer"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1900, impact: "Intermediate in polymer synthesis."),
            funFact: "It has a petrol-like odor and is used in the synthesis of pharmaceuticals.",
            synthesisRoutes: [
                SynthesisRoute(name: "Steam Cracking", description: "Byproduct of ethylene production.", reactants: "Naphtha", conditions: "Heat")
            ],
            chemClass: "Alkenes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Hex-1-yne",
            formula: "C₆H₁₀",
            family: .highEnergy,
            hybridization: .sp,
            bondType: .covalent,
            molarMass: 82.14,
            bondEnergy: 830,
            atoms: [
            A(.C, -3.00, 0.00, 0.00),
            A(.C, -1.70, 0.00, 0.00),
            A(.C, -0.30, 0.50, 0.00),
            A(.C, 1.00, -0.20, 0.00),
            A(.C, 2.30, 0.50, 0.00),
            A(.C, 3.60, -0.20, 0.00),
            A(.H, -3.98, -0.27, -0.38),
            A(.H, -0.26, 1.09, -0.92),
            A(.H, -0.26, 1.09, 0.92),
            A(.H, 1.00, -0.81, -0.90),
            A(.H, 1.00, -0.81, 0.90),
            A(.H, 2.30, 1.11, 0.90),
            A(.H, 2.30, 1.11, -0.90),
            A(.H, 3.47, -1.21, 0.37),
            A(.H, 3.99, -0.24, -1.02),
            A(.H, 4.30, 0.33, 0.64)
        ],
            bonds: [
            B(0, 1, 3), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(0, 6), B(2, 7), B(2, 8), 
            B(3, 9), B(3, 10), B(4, 11), B(4, 12), B(5, 13), B(5, 14), B(5, 15)
        ],
            labMission: "A liquid alkyne used as a building block for complex organic molecules.",
            keyTakeaways: ["Terminal alkyne", "Organic synthesis", "Liquid"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1890, impact: "Reagent in organometallic chemistry."),
            funFact: "Can be used to synthesize pharmaceutical intermediates using 'Click Chemistry'.",
            synthesisRoutes: [
                SynthesisRoute(name: "Alkylation", description: "Reaction of sodium acetylide with butyl bromide.", reactants: "NaC≡CH + C₄H₉Br", conditions: "NH₃(l)")
            ],
            chemClass: "Alkynes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Hept-1-yne",
            formula: "C₇H₁₂",
            family: .highEnergy,
            hybridization: .sp,
            bondType: .covalent,
            molarMass: 96.17,
            bondEnergy: 835,
            atoms: [
            A(.C, -3.50, 0.00, 0.00),
            A(.C, -2.20, 0.00, 0.00),
            A(.C, -0.80, 0.50, 0.00),
            A(.C, 0.50, -0.20, 0.00),
            A(.C, 1.80, 0.50, 0.00),
            A(.C, 3.10, -0.20, 0.00),
            A(.C, 4.40, 0.50, 0.00),
            A(.H, -4.48, -0.11, -0.46),
            A(.H, -0.76, 1.09, -0.92),
            A(.H, -0.76, 1.09, 0.92),
            A(.H, 0.50, -0.81, -0.90),
            A(.H, 0.50, -0.81, 0.90),
            A(.H, 1.80, 1.11, -0.90),
            A(.H, 1.80, 1.11, 0.90),
            A(.H, 3.10, -0.81, 0.90),
            A(.H, 3.10, -0.81, -0.90),
            A(.H, 5.12, -0.07, 0.59),
            A(.H, 4.76, 0.60, -1.02),
            A(.H, 4.28, 1.49, 0.44)
        ],
            bonds: [
            B(0, 1, 3), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(0, 7), B(2, 8), 
            B(2, 9), B(3, 10), B(3, 11), B(4, 12), B(4, 13), B(5, 14), B(5, 15), B(6, 16), 
            B(6, 17), B(6, 18)
        ],
            labMission: "A longer chain alkyne, offering a handle for attaching carbon chains.",
            keyTakeaways: ["Terminal alkyne", "Synthesis reagent", "Lipophilic"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1900, impact: "Used in research laboratories worldwide."),
            funFact: "Like all terminal alkynes, it is slightly acidic and can be deprotonated by strong bases.",
            synthesisRoutes: [
                SynthesisRoute(name: "Alkylation", description: "Reaction of sodium acetylide with pentyl bromide.", reactants: "NaC≡CH + C₅H₁₁Br", conditions: "NH₃(l)")
            ],
            chemClass: "Alkynes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Oct-1-yne",
            formula: "C₈H₁₄",
            family: .highEnergy,
            hybridization: .sp,
            bondType: .covalent,
            molarMass: 110.20,
            bondEnergy: 840,
            atoms: [
            A(.C, -4.00, 0.00, 0.00),
            A(.C, -2.70, 0.00, 0.00),
            A(.C, -1.30, 0.50, 0.00),
            A(.C, 0.00, -0.20, 0.00),
            A(.C, 1.30, 0.50, 0.00),
            A(.C, 2.60, -0.20, 0.00),
            A(.C, 3.90, 0.50, 0.00),
            A(.C, 5.20, -0.20, 0.00),
            A(.H, -4.98, -0.27, 0.39),
            A(.H, -1.26, 1.09, 0.92),
            A(.H, -1.26, 1.09, -0.92),
            A(.H, 0.00, -0.81, -0.90),
            A(.H, -0.00, -0.81, 0.90),
            A(.H, 1.30, 1.11, -0.90),
            A(.H, 1.30, 1.11, 0.90),
            A(.H, 2.60, -0.81, -0.90),
            A(.H, 2.60, -0.81, 0.90),
            A(.H, 3.90, 1.11, -0.90),
            A(.H, 3.90, 1.11, 0.90),
            A(.H, 5.03, -1.27, -0.09),
            A(.H, 5.80, 0.15, -0.84),
            A(.H, 5.72, 0.01, 0.93)
        ],
            bonds: [
            B(0, 1, 3), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 7), B(0, 8), 
            B(2, 9), B(2, 10), B(3, 11), B(3, 12), B(4, 13), B(4, 14), B(5, 15), B(5, 16), 
            B(6, 17), B(6, 18), B(7, 19), B(7, 20), B(7, 21)
        ],
            labMission: "A fatty alkyne used in the synthesis of specialty surfactants.",
            keyTakeaways: ["Long chain", "Surfactant synthesis", "Liquid"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1920, impact: "Building block for functional materials."),
            funFact: "Its long hydrophobic tail makes it useful for modifying sunny surfaces.",
            synthesisRoutes: [
                SynthesisRoute(name: "Alkylation", description: "Reaction of sodium acetylide with hexyl bromide.", reactants: "NaC≡CH + C₆H₁₃Br", conditions: "NH₃(l)")
            ],
            chemClass: "Alkynes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Cyclooctyne",
            formula: "C₈H₁₂",
            family: .highEnergy,
            hybridization: .sp,
            bondType: .covalent,
            molarMass: 108.18,
            bondEnergy: 800, 
            atoms: [
            A(.C, 0.00, 2.00, 0.00),
            A(.C, 1.40, 1.40, 0.00),
            A(.C, 2.00, 0.00, 0.00),
            A(.C, 1.40, -1.40, 0.00),
            A(.C, 0.00, -2.00, 0.00),
            A(.C, -1.40, -1.40, 0.00),
            A(.C, -2.00, 0.00, 0.00),
            A(.C, -1.40, 1.40, 0.00),
            A(.H, 2.59, -0.00, -0.92),
            A(.H, 2.59, 0.00, 0.92),
            A(.H, 1.81, -1.81, -0.92),
            A(.H, 1.81, -1.81, 0.92),
            A(.H, 0.00, -2.59, -0.92),
            A(.H, -0.00, -2.59, 0.92),
            A(.H, -1.81, -1.81, 0.92),
            A(.H, -1.81, -1.81, -0.92),
            A(.H, -2.59, 0.00, -0.92),
            A(.H, -2.59, -0.00, 0.92),
            A(.H, -1.81, 1.81, -0.92),
            A(.H, -1.81, 1.81, 0.92)
        ],
            bonds: [
            B(0, 1, 3), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 7), B(7, 0), 
            B(2, 8), B(2, 9), B(3, 10), B(3, 11), B(4, 12), B(4, 13), B(5, 14), B(5, 15), 
            B(6, 16), B(6, 17), B(7, 18), B(7, 19)
        ],
            labMission: "The smallest stable cycloalkyne, famous for its ring strain and reactivity.",
            keyTakeaways: ["Ring strain", "Click chemistry", "Bioorthogonal"],
            historicContext: HistoricContext(discoverer: "Blomquist & Liu", year: 1953, impact: "Revolutionized bioorthogonal chemistry."),
            funFact: "It reacts spontaneously with azides in living systems without a catalyst (Copper-free click chemistry).",
            synthesisRoutes: [
                SynthesisRoute(name: "Dehydrobromination", description: "Elimination from 1-bromocyclooctene.", reactants: "Bromocyclooctene", conditions: "Strong Base")
            ],
            chemClass: "Alkynes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Phenylacetylene",
            formula: "C₈H₆",
            family: .aromatic,
            hybridization: .sp,
            bondType: .covalent,
            molarMass: 102.13,
            bondEnergy: 850,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.40, 0.00, 0.00),
            A(.C, 2.10, 1.20, 0.00),
            A(.C, 1.40, 2.40, 0.00),
            A(.C, 0.00, 2.40, 0.00),
            A(.C, -0.70, 1.20, 0.00),
            A(.C, 3.50, 1.20, 0.00),
            A(.C, 4.70, 1.20, 0.00),
            A(.H, -0.54, -0.95, 0.00),
            A(.H, 1.94, -0.95, -0.00),
            A(.H, 1.94, 3.35, 0.00),
            A(.H, -0.54, 3.35, -0.00),
            A(.H, -1.79, 1.20, 0.00),
            A(.H, 5.68, 1.56, -0.31)
        ],
            bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0), B(2, 6), B(6, 7, 3), 
            B(0, 8), B(1, 9), B(3, 10), B(4, 11), B(5, 12), B(7, 13)
        ],
            labMission: "Benzene with a torch. A conjugated system merging aromatic stability with alkyne reactivity.",
            keyTakeaways: ["Conjugated", "Polymer precursor", "Aromatic alkyne"],
            historicContext: HistoricContext(discoverer: "Glaser", year: 1870, impact: "Studied for oxidative coupling reactions."),
            funFact: "It can be polymerized to form conductive polymers.",
            synthesisRoutes: [
                SynthesisRoute(name: "Elimination", description: "Dehydrohalogenation of styrene dibromide.", reactants: "Styrene Dibromide", conditions: "NaNH₂")
            ],
            chemClass: "Alkynes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "1-Pentanol",
            formula: "C₅H₁₁OH",
            family: .highEnergy,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 88.15,
            bondEnergy: 430,
            atoms: [
            A(.C, -2.40, 0.00, 0.00),
            A(.C, -1.20, 0.70, 0.00),
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.20, 0.70, 0.00),
            A(.C, 2.40, 0.00, 0.00),
            A(.O, 3.60, 0.70, 0.00),
            A(.H, 4.20, 0.20, 0.00),
            A(.H, -2.77, -0.08, -1.02),
            A(.H, -3.13, 0.53, 0.61),
            A(.H, -2.24, -1.00, 0.41),
            A(.H, -1.20, 1.32, -0.90),
            A(.H, -1.20, 1.32, 0.90),
            A(.H, 0.00, -0.62, -0.90),
            A(.H, -0.00, -0.62, 0.90),
            A(.H, 1.20, 1.32, 0.90),
            A(.H, 1.20, 1.32, -0.90),
            A(.H, 2.40, -0.62, -0.90),
            A(.H, 2.40, -0.62, 0.90)
        ],
            bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(0, 7), B(0, 8), 
            B(0, 9), B(1, 10), B(1, 11), B(2, 12), B(2, 13), B(3, 14), B(3, 15), B(4, 16), 
            B(4, 17)
        ],
            labMission: "Amyl alcohol. Used in the production of flavors and fragrances.",
            keyTakeaways: ["Fusel oil", "Flavoring", "Solvent"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1850, impact: "Component of fermentation byproducts."),
            funFact: "It smells distinctively unpleasant, like balsamic vinegar and rot.",
            synthesisRoutes: [
                SynthesisRoute(name: "Hydroformylation", description: "Oxo process of 1-butene.", reactants: "1-Butene + CO + H₂", conditions: "Rh Catalyst")
            ],
            chemClass: "Alcohols"
        ).toMolecule(),

        MoleculeDefinition(
            name: "1-Hexanol",
            formula: "C₆H₁₃OH",
            family: .highEnergy,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 102.18,
            bondEnergy: 440,
            atoms: [
            A(.C, -3.00, 0.00, 0.00),
            A(.C, -1.80, 0.70, 0.00),
            A(.C, -0.60, 0.00, 0.00),
            A(.C, 0.60, 0.70, 0.00),
            A(.C, 1.80, 0.00, 0.00),
            A(.C, 3.00, 0.70, 0.00),
            A(.O, 4.20, 0.00, 0.00),
            A(.H, 4.80, 0.50, 0.00),
            A(.H, -3.52, 0.18, -0.94),
            A(.H, -3.62, 0.34, 0.83),
            A(.H, -2.80, -1.07, 0.11),
            A(.H, -1.80, 1.32, 0.90),
            A(.H, -1.80, 1.32, -0.90),
            A(.H, -0.60, -0.62, 0.90),
            A(.H, -0.60, -0.62, -0.90),
            A(.H, 0.60, 1.32, 0.90),
            A(.H, 0.60, 1.32, -0.90),
            A(.H, 1.80, -0.62, 0.90),
            A(.H, 1.80, -0.62, -0.90),
            A(.H, 3.00, 1.32, -0.90),
            A(.H, 3.00, 1.32, 0.90)
        ],
            bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 7), B(0, 8), 
            B(0, 9), B(0, 10), B(1, 11), B(1, 12), B(2, 13), B(2, 14), B(3, 15), B(3, 16), 
            B(4, 17), B(4, 18), B(5, 19), B(5, 20)
        ],
            labMission: "A fatty alcohol that smells like freshly cut grass.",
            keyTakeaways: ["Green scent", "Perfume ingredient", "Fatty alcohol"],
            historicContext: HistoricContext(discoverer: "Perfumers", year: 1900, impact: "Used to create 'green' notes in fragrances."),
            funFact: "It is exactly the smell you associate with a freshly mowed lawn.",
            synthesisRoutes: [
                SynthesisRoute(name: "Alfol Process", description: "Oligomerization of ethylene followed by oxidation.", reactants: "Ethylene", conditions: "Al Et3 Catalyst")
            ],
            chemClass: "Alcohols"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Cyclohexanol",
            formula: "C₆H₁₁OH",
            family: .cyclicHydrocarbon,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 100.16,
            bondEnergy: 450,
            atoms: [
            A(.C, 1.26, 0.45, 0.73),
            A(.C, 1.26, -0.45, -0.73),
            A(.C, 0.00, 1.00, 0.00),
            A(.C, 0.00, -1.00, 0.00),
            A(.C, -1.26, 0.45, -0.73),
            A(.C, -1.26, -0.45, 0.73),
            A(.O, 0.00, 2.40, 0.00),
            A(.H, 0.60, 2.80, 0.00),
            A(.H, 1.11, -0.10, 1.66),
            A(.H, 2.09, 1.14, 0.90),
            A(.H, 2.09, -1.14, -0.90),
            A(.H, 1.11, 0.10, -1.66),
            A(.H, 0.53, 0.74, -0.92),
            A(.H, -0.47, -1.57, -0.80),
            A(.H, 0.47, -1.57, 0.80),
            A(.H, -2.09, 1.14, -0.90),
            A(.H, -1.11, -0.10, -1.66),
            A(.H, -2.09, -1.14, 0.90),
            A(.H, -1.11, 0.10, 1.66)
        ],
            bonds: [
            B(0, 2), B(2, 4), B(4, 5), B(5, 3), B(3, 1), B(1, 0), B(2, 6), B(6, 7), 
            B(0, 8), B(0, 9), B(1, 10), B(1, 11), B(2, 12), B(3, 13), B(3, 14), B(4, 15), 
            B(4, 16), B(5, 17), B(5, 18)
        ],
            labMission: "A thick, camphor-smelling liquid used to make nylon.",
            keyTakeaways: ["Nylon precursor", "Secondary alcohol", "Viscous"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1890, impact: "Precursor to adipic acid."),
            funFact: "It freezes at room temperature (25°C), often solidifying in the bottle.",
            synthesisRoutes: [
                SynthesisRoute(name: "Cyclohexane Oxidation", description: "Air oxidation of cyclohexane.", reactants: "C₆H₁₂ + O₂", conditions: "Co Catalyst")
            ],
            chemClass: "Alcohols"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Glycerol",
            formula: "C₃H₈O₃",
            family: .biomolecule,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 92.09,
            bondEnergy: 480,
            atoms: [
            A(.C, 0.00, 1.00, 0.00),
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 0.00, -1.00, 0.00),
            A(.O, 1.30, 1.00, 0.00),
            A(.H, 1.80, 1.50, 0.00),
            A(.O, -1.30, 0.00, 0.00),
            A(.H, -1.80, -0.50, 0.00),
            A(.O, 1.30, -1.00, 0.00),
            A(.H, 1.80, -1.50, 0.00),
            A(.H, -0.46, 1.46, 0.88),
            A(.H, -0.46, 1.46, -0.88),
            A(.H, 1.08, -0.00, -0.14),
            A(.H, -0.46, -1.46, -0.88),
            A(.H, -0.46, -1.46, 0.88)
        ],
            bonds: [
            B(0, 1), B(1, 2), B(0, 3), B(3, 4), B(1, 5), B(5, 6), B(2, 7), B(7, 8), 
            B(0, 9), B(0, 10), B(1, 11), B(2, 12), B(2, 13)
        ],
            labMission: "A sweet, viscous backbone of all fats and oils.",
            keyTakeaways: ["Humectant", "Backbone of lipids", "Non-toxic"],
            historicContext: HistoricContext(discoverer: "Carl Wilhelm Scheele", year: 1779, impact: "Isolated from olive oil."),
            funFact: "It tastes sweet and is used in low-sugar foods, but also to make nitroglycerin explosives.",
            synthesisRoutes: [
                SynthesisRoute(name: "Saponification", description: "Hydrolysis of triglycerides (fats).", reactants: "Fat + NaOH", conditions: "Heat")
            ],
            chemClass: "Alcohols"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Diisopropyl Ether",
            formula: "C₆H₁₄O",
            family: .highEnergy,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 102.18,
            bondEnergy: 400,
            atoms: [
            A(.O, 0.00, 0.00, 0.00),
            A(.C, -1.20, 0.50, 0.00),
            A(.C, 1.20, 0.50, 0.00),
            A(.C, -1.50, 1.80, 0.00),
            A(.C, -2.00, -0.50, 0.00),
            A(.C, 1.50, 1.80, 0.00),
            A(.C, 2.00, -0.50, 0.00),
            A(.H, -1.25, 0.62, 1.08),
            A(.H, 1.25, 0.62, -1.08),
            A(.H, -2.58, 1.92, -0.11),
            A(.H, -1.18, 2.25, 0.94),
            A(.H, -0.99, 2.29, -0.83),
            A(.H, -2.09, -0.89, -1.01),
            A(.H, -1.61, -1.28, 0.66),
            A(.H, -2.98, -0.18, 0.36),
            A(.H, 2.19, 2.01, 0.82),
            A(.H, 0.59, 2.38, 0.13),
            A(.H, 1.97, 2.06, -0.95),
            A(.H, 1.96, -0.99, -0.97),
            A(.H, 3.01, -0.15, 0.19),
            A(.H, 1.70, -1.20, 0.78)
        ],
            bonds: [
            B(0, 1), B(0, 2), B(1, 3), B(1, 4), B(2, 5), B(2, 6), B(1, 7), B(2, 8), 
            B(3, 9), B(3, 10), B(3, 11), B(4, 12), B(4, 13), B(4, 14), B(5, 15), B(5, 16), 
            B(5, 17), B(6, 18), B(6, 19), B(6, 20)
        ],
            labMission: "A solvent that loves to form explosive peroxides if left alone too long.",
            keyTakeaways: ["Solvent", "Peroxide hazard", "Gasoline additive"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1920, impact: "Used as an oxygenate in fuel."),
            funFact: "It is infamous in labs for crystallizing into shock-sensitive explosives in the bottle cap.",
            synthesisRoutes: [
                SynthesisRoute(name: "Propene Hydration", description: "Byproduct of isopropanol production.", reactants: "Propene + Water", conditions: "Acid Catalyst")
            ],
            chemClass: "Ethers"
        ).toMolecule(),

        MoleculeDefinition(
            name: "MTBE",
            formula: "C₅H₁₂O",
            family: .highEnergy,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 88.15,
            bondEnergy: 380,
            atoms: [
            A(.O, 0.00, 0.00, 0.00),
            A(.C, -1.20, 0.00, 0.00),
            A(.C, 1.30, 0.00, 0.00),
            A(.C, 1.30, 1.30, 0.00),
            A(.C, 1.30, -1.30, 0.00),
            A(.C, 2.60, 0.00, 0.00),
            A(.H, -1.56, 0.35, 0.97),
            A(.H, -1.56, -1.01, -0.18),
            A(.H, -1.56, 0.67, -0.78),
            A(.H, 2.33, 1.66, -0.01),
            A(.H, 0.78, 1.66, -0.88),
            A(.H, 0.80, 1.66, 0.90),
            A(.H, 2.29, -1.66, -0.28),
            A(.H, 0.56, -1.66, -0.72),
            A(.H, 1.05, -1.66, 1.00),
            A(.H, 2.96, 1.03, 0.04),
            A(.H, 2.96, -0.48, -0.91),
            A(.H, 2.96, -0.55, 0.87)
        ],
            bonds: [
            B(0, 1), B(0, 2), B(2, 3), B(2, 4), B(2, 5), B(1, 6), B(1, 7), B(1, 8), 
            B(3, 9), B(3, 10), B(3, 11), B(4, 12), B(4, 13), B(4, 14), B(5, 15), B(5, 16), 
            B(5, 17)
        ],
            labMission: "Methyl tert-butyl ether. The controversial gasoline additive that reduced smog but tainted water.",
            keyTakeaways: ["Fuel additive", "Octane booster", "Groundwater pollutant"],
            historicContext: HistoricContext(discoverer: "Petroleum Industry", year: 1970, impact: "Replaced lead in gasoline."),
            funFact: "Phased out in many countries because it tastes like turpentine even in tiny amounts in water.",
            synthesisRoutes: [
                SynthesisRoute(name: "Etherification", description: "Reaction of isobutylene with methanol.", reactants: "Isobutylene + Methanol", conditions: "Acid Catalyst")
            ],
            chemClass: "Ethers"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Ethylene Oxide",
            formula: "C₂H₄O",
            family: .highEnergy,
            hybridization: .sp3, 
            bondType: .covalent,
            molarMass: 44.05,
            bondEnergy: 300,
            atoms: [
            A(.O, 0.00, 1.00, 0.00),
            A(.C, 0.70, -0.20, 0.00),
            A(.C, -0.70, -0.20, 0.00),
            A(.H, 1.26, -0.52, -0.88),
            A(.H, 1.26, -0.52, 0.88),
            A(.H, -1.26, -0.52, -0.88),
            A(.H, -1.26, -0.52, 0.88)
        ],
            bonds: [
            B(0, 1), B(0, 2), B(1, 2), B(1, 3), B(1, 4), B(2, 5), B(2, 6)
        ],
            labMission: "A strained ring gas used to sterilize medical equipment.",
            keyTakeaways: ["Epoxide", "Sterilant", "Highly reactive"],
            historicContext: HistoricContext(discoverer: "Charles-Adolphe Wurtz", year: 1859, impact: "Foundation of surfactant chemistry."),
            funFact: "Used to sterilize spices and medical devices that can't handle heat.",
            synthesisRoutes: [
                SynthesisRoute(name: "Direct Oxidation", description: "Oxidation of ethylene.", reactants: "C₂H₄ + O₂", conditions: "Ag Catalyst, 250°C")
            ],
            chemClass: "Ethers"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Epichlorohydrin",
            formula: "C₃H₅ClO",
            family: .highEnergy,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 92.52,
            bondEnergy: 350,
            atoms: [
            A(.O, 0.00, 1.00, 0.00),
            A(.C, 0.70, -0.20, 0.00),
            A(.C, -0.70, -0.20, 0.00),
            A(.C, -2.00, -0.50, 0.00),
            A(.Cl, -3.20, 0.50, 0.00),
            A(.H, 1.26, -0.52, -0.88),
            A(.H, 1.26, -0.52, 0.88),
            A(.H, -0.70, -1.07, 0.66),
            A(.H, -2.14, -1.08, -0.91),
            A(.H, -2.14, -1.08, 0.91)
        ],
            bonds: [
            B(0, 1), B(0, 2), B(1, 2), B(2, 3), B(3, 4), B(1, 5), B(1, 6), B(2, 7), 
            B(3, 8), B(3, 9)
        ],
            labMission: "The sticky connection. A key ingredient in epoxy resins.",
            keyTakeaways: ["Epoxy resin", "Carcinogen", "Chiral"],
            historicContext: HistoricContext(discoverer: "Berthelot", year: 1854, impact: "Essential for modern adhesives."),
            funFact: "If you've ever used Super Glue or Epoxy, this molecule made it possible.",
            synthesisRoutes: [
                SynthesisRoute(name: "Chlorohydrin Process", description: "Reaction of allyl chloride with hypochlorous acid.", reactants: "Allyl Chloride + HOCl", conditions: "Base")
            ],
            chemClass: "Ethers"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Methyl Vinyl Ether",
            formula: "C₃H₆O",
            family: .polymer,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 58.08,
            bondEnergy: 360,
            atoms: [
            A(.O, 0.00, 0.00, 0.00),
            A(.C, -1.20, 0.00, 0.00),
            A(.C, 1.20, 0.40, 0.00),
            A(.C, 2.40, -0.30, 0.00),
            A(.H, -1.56, 0.82, 0.61),
            A(.H, -1.56, 0.12, -1.02),
            A(.H, -1.56, -0.94, 0.41),
            A(.H, 1.31, 1.48, 0.00),
            A(.H, 3.24, 0.05, -0.61),
            A(.H, 2.51, -1.20, 0.61)
        ],
            bonds: [
            B(0, 1), B(0, 2), B(2, 3, 2), B(1, 4), B(1, 5), B(1, 6), B(2, 7), B(3, 8), 
            B(3, 9)
        ],
            labMission: "A versatile synthon for making adhesives and coatings.",
            keyTakeaways: ["Monomer", "Adhesives", "Reactive ether"],
            historicContext: HistoricContext(discoverer: "Reppe", year: 1930, impact: "Vinyl ether chemistry pioneer."),
            funFact: "Used to make the glue on the back of postage stamps.",
            synthesisRoutes: [
                SynthesisRoute(name: "Vinylation", description: "Reaction of acetylene with methanol.", reactants: "C₂H₂ + CH₃OH", conditions: "KOH Catalyst")
            ],
            chemClass: "Ethers"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Butyraldehyde",
            formula: "C₄H₈O",
            family: .highEnergy,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 72.11,
            bondEnergy: 1070,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.C, -2.60, 0.00, 0.00),
            A(.C, -3.90, -0.70, 0.00),
            A(.H, 0.94, -0.56, 0.00),
            A(.H, -1.30, -1.31, 0.90),
            A(.H, -1.30, -1.31, -0.90),
            A(.H, -2.60, 0.61, -0.90),
            A(.H, -2.60, 0.61, 0.90),
            A(.H, -4.57, -0.22, -0.71),
            A(.H, -3.75, -1.74, -0.28),
            A(.H, -4.34, -0.65, 1.00)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3), B(3, 4), B(0, 5), B(2, 6), B(2, 7), B(3, 8), 
            B(3, 9), B(4, 10), B(4, 11), B(4, 12)
        ],
            labMission: "A pungent intermediate used to make rubber accelerators.",
            keyTakeaways: ["Acrid smell", "Industrial intermediate", "Flammable"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1860, impact: "Accelerator production."),
            funFact: "Exposure changes its smell from pungent to rotting fruit as concentration increases.",
             synthesisRoutes: [
                SynthesisRoute(name: "Hydroformylation", description: "Oxo process of propylene.", reactants: "C₃H₆ + CO + H₂", conditions: "Rh Catalyst")
            ],
            chemClass: "Aldehydes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Valeraldehyde",
            formula: "C₅H₁₀O",
            family: .highEnergy,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 86.13,
            bondEnergy: 1080,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.C, -2.60, 0.00, 0.00),
            A(.C, -3.90, -0.70, 0.00),
            A(.C, -5.20, 0.00, 0.00),
            A(.H, 0.94, -0.56, -0.00),
            A(.H, -1.30, -1.31, -0.90),
            A(.H, -1.30, -1.31, 0.90),
            A(.H, -2.60, 0.61, -0.90),
            A(.H, -2.60, 0.61, 0.90),
            A(.H, -3.90, -1.31, -0.90),
            A(.H, -3.90, -1.31, 0.90),
            A(.H, -5.88, -0.50, -0.68),
            A(.H, -5.06, 1.03, -0.32),
            A(.H, -5.62, -0.01, 1.01)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3), B(3, 4), B(4, 5), B(0, 6), B(2, 7), B(2, 8), 
            B(3, 9), B(3, 10), B(4, 11), B(4, 12), B(5, 13), B(5, 14), B(5, 15)
        ],
            labMission: "Pentanal. A fermented flavor component with a nutty, fruit-like odor.",
            keyTakeaways: ["Flavoring", "Resin manufacture", "Fermentation"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1900, impact: "Flavor chemistry."),
            funFact: "Used in fruit flavors and also as a rubber accelerator.",
            synthesisRoutes: [
                SynthesisRoute(name: "Hydroformylation", description: "Oxo process of 1-butene.", reactants: "1-Butene + CO + H₂", conditions: "Rh Catalyst")
            ],
            chemClass: "Aldehydes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Hexanal",
            formula: "C₆H₁₂O",
            family: .highEnergy,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 100.16,
            bondEnergy: 1090,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.C, -2.60, 0.00, 0.00),
            A(.C, -3.90, -0.70, 0.00),
            A(.C, -5.20, 0.00, 0.00),
            A(.C, -6.50, -0.70, 0.00),
            A(.H, 0.94, -0.56, 0.00),
            A(.H, -1.30, -1.31, 0.90),
            A(.H, -1.30, -1.31, -0.90),
            A(.H, -2.60, 0.61, -0.90),
            A(.H, -2.60, 0.61, 0.90),
            A(.H, -3.90, -1.31, -0.90),
            A(.H, -3.90, -1.31, 0.90),
            A(.H, -5.20, 0.61, -0.90),
            A(.H, -5.20, 0.61, 0.90),
            A(.H, -6.56, -1.35, -0.87),
            A(.H, -7.31, 0.03, -0.04),
            A(.H, -6.59, -1.29, 0.91)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(0, 7), B(2, 8), 
            B(2, 9), B(3, 10), B(3, 11), B(4, 12), B(4, 13), B(5, 14), B(5, 15), B(6, 16), 
            B(6, 17), B(6, 18)
        ],
            labMission: "The smell of fresh green grass and cucumber.",
            keyTakeaways: ["Green scent", "Aldehyde C-6", "Rancidity marker"],
            historicContext: HistoricContext(discoverer: "Food Scientists", year: 1920, impact: "Understanding lipid oxidation."),
            funFact: "While it smells like grass, it's also a key marker of meat going bad (lipid oxidation).",
            synthesisRoutes: [
                SynthesisRoute(name: "Alcohol Oxidation", description: "Oxidation of 1-hexanol.", reactants: "C₆H₁₃OH + [O]", conditions: "Catalyst")
            ],
            chemClass: "Aldehydes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Vanillin",
            formula: "C₈H₈O₃",
            family: .aromatic,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 152.15,
            bondEnergy: 1150,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.40, 0.00, 0.00),
            A(.C, 2.10, 1.20, 0.00),
            A(.C, 1.40, 2.40, 0.00),
            A(.C, 0.00, 2.40, 0.00),
            A(.C, -0.70, 1.20, 0.00),
            A(.C, 3.50, 1.20, 0.00),
            A(.O, 4.20, 2.00, 0.00),
            A(.O, 1.40, -1.40, 0.00),
            A(.H, 2.00, -1.80, 0.00),
            A(.O, -1.40, -1.40, 0.00),
            A(.C, -2.00, -2.40, 0.00),
            A(.H, 1.94, 3.35, 0.00),
            A(.H, -0.54, 3.35, -0.00),
            A(.H, -1.79, 1.20, 0.00),
            A(.H, 3.95, 0.21, -0.00),
            A(.H, -1.50, -3.12, -0.64),
            A(.H, -2.05, -2.79, 1.02),
            A(.H, -3.01, -2.22, -0.37)
        ],
            bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0), B(2, 6), B(6, 7, 2), 
            B(1, 8), B(8, 9), B(0, 10), B(10, 11), B(3, 12), B(4, 13), B(5, 14), B(6, 15), 
            B(11, 16), B(11, 17), B(11, 18)
        ],
            labMission: "The world's most popular flavor. The primary component of vanilla bean extract.",
            keyTakeaways: ["Vanilla", "Antioxidant", "Phenolic aldehyde"],
            historicContext: HistoricContext(discoverer: "Nicolas-Theodore Gobley", year: 1858, impact: "Isolated from vanilla pods."),
            funFact: "99% of vanillin used today is synthetic, made from petrochemicals or biological sources like lignin.",
            synthesisRoutes: [
                SynthesisRoute(name: "Guaiacol Route", description: "Reaction of guaiacol with glyoxylic acid.", reactants: "Guaiacol + Glyoxylic Acid", conditions: "Oxidation")
            ],
            chemClass: "Aldehydes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Retinal",
            formula: "C₅H₆O",
            family: .biomolecule,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 82.10,
            bondEnergy: 2000,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.C, -1.20, -0.50, 0.00),
            A(.C, -2.40, 0.00, 0.00),
            A(.C, -3.60, -0.50, 0.00),
            A(.C, -4.80, 0.00, 0.00),
            A(.H, 0.91, -0.60, -0.00),
            A(.H, -1.20, -1.59, -0.00),
            A(.H, -2.40, 1.09, 0.00),
            A(.H, -3.60, -1.59, -0.00),
            A(.H, -5.63, -0.57, 0.42),
            A(.H, -4.98, 0.99, -0.42)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(0, 6), B(2, 7), B(3, 8), 
            B(4, 9), B(5, 10), B(5, 11)
        ],
            labMission: "Vitamin A aldehyde. The molecule that allows you to see this text.",
            keyTakeaways: ["Vision", "Isomerization", "Vitamin A"],
            historicContext: HistoricContext(discoverer: "George Wald", year: 1933, impact: "Nobel prize for mechanism of vision."),
            funFact: "When light hits it, it straightens out (cis to trans), triggering a nerve impulse to your brain.",
            synthesisRoutes: [
                SynthesisRoute(name: "Biosynthesis", description: "Oxidation of Vitamin A (Retinol).", reactants: "Retinol + NAD⁺", conditions: "Enzymatic")
            ],
            chemClass: "Aldehydes"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Pentan-3-one",
            formula: "C₅H₁₀O",
            family: .highEnergy,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 86.13,
            bondEnergy: 1090,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.C, -2.60, 0.00, 0.00),
            A(.C, 1.30, -0.70, 0.00),
            A(.C, 2.60, 0.00, 0.00),
            A(.H, -1.30, -1.31, 0.90),
            A(.H, -1.30, -1.31, -0.90),
            A(.H, -3.41, -0.73, -0.06),
            A(.H, -2.65, 0.67, -0.86),
            A(.H, -2.70, 0.58, 0.92),
            A(.H, 1.30, -1.31, -0.90),
            A(.H, 1.30, -1.31, 0.90),
            A(.H, 2.46, 1.03, -0.34),
            A(.H, 3.01, 0.00, 1.01),
            A(.H, 3.29, -0.51, -0.67)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4), B(4, 5), B(2, 6), B(2, 7), B(3, 8), 
            B(3, 9), B(3, 10), B(4, 11), B(4, 12), B(5, 13), B(5, 14), B(5, 15)
        ],
            labMission: "Diethyl ketone. A symmetric structural isomer of the pentanone family.",
            keyTakeaways: ["Symmetric ketone", "Solvent", "Fuel"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1840, impact: "Solvent chemistry."),
            funFact: "Less common than its isomer methyl propyl ketone.",
            synthesisRoutes: [
                SynthesisRoute(name: "Decarboxylation", description: "Ketonic decarboxylation of propionic acid.", reactants: "2 C₂H₅COOH → C₅H₁₀O + CO₂ + H₂O", conditions: "MnO₂ Catalyst")
            ],
            chemClass: "Ketones"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Hexan-2-one",
            formula: "C₆H₁₂O",
            family: .highEnergy,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 100.16,
            bondEnergy: 1100,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.C, 1.30, -0.70, 0.00),
            A(.C, 2.60, 0.00, 0.00),
            A(.C, 3.90, -0.70, 0.00),
            A(.C, 5.20, 0.00, 0.00),
            A(.H, -1.95, -0.27, -0.76),
            A(.H, -1.77, -0.59, 0.98),
            A(.H, -1.14, -1.76, -0.21),
            A(.H, 1.30, -1.31, 0.90),
            A(.H, 1.30, -1.31, -0.90),
            A(.H, 2.60, 0.61, -0.90),
            A(.H, 2.60, 0.61, 0.90),
            A(.H, 3.90, -1.31, 0.90),
            A(.H, 3.90, -1.31, -0.90),
            A(.H, 5.39, 0.41, -0.99),
            A(.H, 5.18, 0.81, 0.73),
            A(.H, 5.99, -0.70, 0.26)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(0, 3), B(3, 4), B(4, 5), B(5, 6), B(2, 7), B(2, 8), 
            B(2, 9), B(3, 10), B(3, 11), B(4, 12), B(4, 13), B(5, 14), B(5, 15), B(6, 16), 
            B(6, 17), B(6, 18)
        ],
            labMission: "Methyl butyl ketone. A neurotoxic solvent found in paint thinners.",
            keyTakeaways: ["Neurotoxic", "Solvent", "Metabolic poison"],
            historicContext: HistoricContext(discoverer: "Toxicologists", year: 1970, impact: "Identified peripheral neuropathy risks."),
            funFact: "Famous for causing 'huffer's neuropathy' in solvent abusers.",
            synthesisRoutes: [
                SynthesisRoute(name: "Alcohol Oxidation", description: "Oxidation of 2-hexanol.", reactants: "2-Hexanol + [O]", conditions: "Catalyst")
            ],
            chemClass: "Ketones"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Heptan-2-one",
            formula: "C₇H₁₄O",
            family: .highEnergy,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 114.19,
            bondEnergy: 1110,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.C, 1.30, -0.70, 0.00),
            A(.C, 2.60, 0.00, 0.00),
            A(.C, 3.90, -0.70, 0.00),
            A(.C, 5.20, 0.00, 0.00),
            A(.C, 6.50, -0.70, 0.00),
            A(.H, -1.26, -1.55, 0.68),
            A(.H, -1.52, -1.05, -1.01),
            A(.H, -2.08, -0.01, 0.32),
            A(.H, 1.30, -1.31, 0.90),
            A(.H, 1.30, -1.31, -0.90),
            A(.H, 2.60, 0.61, 0.90),
            A(.H, 2.60, 0.61, -0.90),
            A(.H, 3.90, -1.31, 0.90),
            A(.H, 3.90, -1.31, -0.90),
            A(.H, 5.20, 0.61, 0.90),
            A(.H, 5.20, 0.61, -0.90),
            A(.H, 6.33, -1.78, 0.04),
            A(.H, 7.05, -0.45, -0.91),
            A(.H, 7.08, -0.39, 0.87)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(0, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 7), B(2, 8), 
            B(2, 9), B(2, 10), B(3, 11), B(3, 12), B(4, 13), B(4, 14), B(5, 15), B(5, 16), 
            B(6, 17), B(6, 18), B(7, 19), B(7, 20), B(7, 21)
        ],
            labMission: "Methyl amyl ketone. A fruit-smelling solvent used in fragrances.",
            keyTakeaways: ["Blue cheese smell", "Solvent", "Pheromone"],
            historicContext: HistoricContext(discoverer: "Unknown", year: 1900, impact: "Flavor industry."),
            funFact: "It is a component of the alarm pheromone of bees.",
            synthesisRoutes: [
                SynthesisRoute(name: "Alcohol Oxidation", description: "Oxidation of 2-heptanol.", reactants: "2-Heptanol + [O]", conditions: "Catalyst")
            ],
            chemClass: "Ketones"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Camphor",
            formula: "C₆H₈O",
            family: .biomolecule, 
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 96.13,
            bondEnergy: 2000,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.40, 0.00, 0.00),
            A(.C, 0.70, 1.00, 1.00),
            A(.C, -0.70, -1.00, 0.00),
            A(.C, 2.10, -1.00, 0.00),
            A(.C, 0.70, -2.00, 0.00),
            A(.O, 2.80, -0.50, 0.00),
            A(.H, -0.54, 0.55, -0.77),
            A(.H, 1.94, 0.55, -0.77),
            A(.H, 0.67, 2.08, 0.84),
            A(.H, 0.73, 0.84, 2.08),
            A(.H, -1.33, -1.11, -0.88),
            A(.H, -1.33, -1.11, 0.88),
            A(.H, 0.70, -2.63, -0.89),
            A(.H, 0.70, -2.63, 0.89)
        ],
            bonds: [
            B(0, 1), B(0, 2), B(1, 2), B(0, 3), B(3, 5), B(5, 4), B(4, 1), B(4, 6, 2), 
            B(0, 7), B(1, 8), B(2, 9), B(2, 10), B(3, 11), B(3, 12), B(5, 13), B(5, 14)
        ],
            labMission: "A waxy, strong-scented terpene used in mothballs and medicine.",
            keyTakeaways: ["Vicks VapoRub", "Terpenoid", "Sublimation"],
            historicContext: HistoricContext(discoverer: "Ancient Asia", year: 500, impact: "Traditional medicine."),
            funFact: "It feels cold on the skin because it stimulates cold receptors, not because it actually cools.",
             synthesisRoutes: [
                SynthesisRoute(name: "Oppenauer Oxidation", description: "Oxidation of isoborneol.", reactants: "Isoborneol", conditions: "Base/Acetone")
            ],
            chemClass: "Ketones"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Muscone",
            formula: "C₁₆H₃₀O",
            family: .biomolecule,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 238.41,
            bondEnergy: 3000,
            atoms: [
            // 15-membered ring carbons (C0-C14)
            A(.C, 3.80, 0.00, 0.00),   // C0  (carbonyl carbon)
            A(.C, 3.50, 1.40, 0.00),   // C1
            A(.C, 2.60, 2.50, 0.00),   // C2
            A(.C, 1.20, 3.00, 0.00),   // C3  (methyl branch)
            A(.C, -0.10, 3.00, 0.00),  // C4
            A(.C, -1.40, 2.50, 0.00),  // C5
            A(.C, -2.40, 1.60, 0.00),  // C6
            A(.C, -2.90, 0.20, 0.00),  // C7
            A(.C, -2.80, -1.20, 0.00), // C8
            A(.C, -2.10, -2.30, 0.00), // C9
            A(.C, -0.90, -2.90, 0.00), // C10
            A(.C, 0.40, -2.90, 0.00),  // C11
            A(.C, 1.60, -2.40, 0.00),  // C12
            A(.C, 2.60, -1.50, 0.00),  // C13
            A(.C, 3.30, -0.50, 0.00),  // C14
            // Carbonyl oxygen
            A(.O, 5.00, 0.00, 0.00),   // O15
            // Methyl branch on C3
            A(.C, 1.20, 4.50, 0.00),   // C16 (methyl)
            // Hydrogens on ring carbons (2H per CH₂, 1H on C3)
            A(.H, 3.80, 1.40, 0.90),   // H17 on C1
            A(.H, 4.20, 2.10, -0.50),  // H18 on C1
            A(.H, 2.60, 2.80, 0.90),   // H19 on C2
            A(.H, 3.20, 3.20, -0.50),  // H20 on C2
            A(.H, 1.20, 2.60, -0.95),  // H21 on C3
            A(.H, -0.10, 3.40, 0.90),  // H22 on C4
            A(.H, -0.50, 3.70, -0.50), // H23 on C4
            A(.H, -1.40, 2.80, 0.90),  // H24 on C5
            A(.H, -1.90, 3.20, -0.50), // H25 on C5
            A(.H, -2.40, 1.90, 0.90),  // H26 on C6
            A(.H, -3.20, 2.10, -0.50), // H27 on C6
            A(.H, -2.90, 0.50, 0.90),  // H28 on C7
            A(.H, -3.80, -0.10, -0.50),// H29 on C7
            A(.H, -2.80, -1.50, 0.90), // H30 on C8
            A(.H, -3.60, -1.50, -0.50),// H31 on C8
            A(.H, -2.10, -2.60, 0.90), // H32 on C9
            A(.H, -2.80, -3.00, -0.50),// H33 on C9
            A(.H, -0.90, -3.20, 0.90), // H34 on C10
            A(.H, -1.30, -3.70, -0.50),// H35 on C10
            A(.H, 0.40, -3.20, 0.90),  // H36 on C11
            A(.H, 0.80, -3.70, -0.50), // H37 on C11
            A(.H, 1.60, -2.70, 0.90),  // H38 on C12
            A(.H, 2.10, -3.10, -0.50), // H39 on C12
            A(.H, 2.60, -1.80, 0.90),  // H40 on C13
            A(.H, 3.30, -2.10, -0.50), // H41 on C13
            A(.H, 3.30, -0.80, 0.90),  // H42 on C14
            A(.H, 4.10, -0.90, -0.50), // H43 on C14
            // Methyl H on C16
            A(.H, 0.40, 4.90, 0.40),   // H44
            A(.H, 1.20, 4.90, -0.95),  // H45
            A(.H, 2.00, 4.90, 0.40)    // H46
        ],
            bonds: [
            // Ring bonds (C0-C1-...-C14-C0)
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 7),
            B(7, 8), B(8, 9), B(9, 10), B(10, 11), B(11, 12), B(12, 13), B(13, 14), B(14, 0),
            // Carbonyl
            B(0, 15, 2),
            // Methyl branch
            B(3, 16),
            // H on C1
            B(1, 17), B(1, 18),
            // H on C2
            B(2, 19), B(2, 20),
            // H on C3
            B(3, 21),
            // H on C4
            B(4, 22), B(4, 23),
            // H on C5
            B(5, 24), B(5, 25),
            // H on C6
            B(6, 26), B(6, 27),
            // H on C7
            B(7, 28), B(7, 29),
            // H on C8
            B(8, 30), B(8, 31),
            // H on C9
            B(9, 32), B(9, 33),
            // H on C10
            B(10, 34), B(10, 35),
            // H on C11
            B(11, 36), B(11, 37),
            // H on C12
            B(12, 38), B(12, 39),
            // H on C13
            B(13, 40), B(13, 41),
            // H on C14
            B(14, 42), B(14, 43),
            // Methyl H
            B(16, 44), B(16, 45), B(16, 46)
        ],
            labMission: "The primary scent of musk deer, the foundation of perfumery.",
            keyTakeaways: ["Musk", "Macrocycle", "Perfume base"],
            historicContext: HistoricContext(discoverer: "Heinrich Walbaum", year: 1906, impact: "Identified structure of musk."),
            funFact: "Natural musk is worth more than gold; synthetic muscone replaced it to save the deer.",
            synthesisRoutes: [
                SynthesisRoute(name: "Favorskii Rearrangement", description: "Cyclization of acyclic precursors.", reactants: "Precursors", conditions: "Complex")
            ],
            chemClass: "Ketones"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Valeric Acid",
            formula: "C₅H₁₀O₂",
            family: .biomolecule,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 102.13,
            bondEnergy: 1160,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.O, 1.10, -0.60, 0.00),
            A(.H, 1.80, -0.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.C, -2.60, 0.00, 0.00),
            A(.C, -3.90, -0.70, 0.00),
            A(.C, -5.20, 0.00, 0.00),
            A(.H, -1.30, -1.31, 0.90),
            A(.H, -1.30, -1.31, -0.90),
            A(.H, -2.60, 0.61, 0.90),
            A(.H, -2.60, 0.61, -0.90),
            A(.H, -3.90, -1.31, -0.90),
            A(.H, -3.90, -1.31, 0.90),
            A(.H, -5.97, -0.66, -0.40),
            A(.H, -5.13, 0.90, -0.62),
            A(.H, -5.46, 0.28, 1.02)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4), B(4, 5), B(5, 6), B(6, 7), B(4, 8), 
            B(4, 9), B(5, 10), B(5, 11), B(6, 12), B(6, 13), B(7, 14), B(7, 15), B(7, 16)
        ],
            labMission: "The smell of old socks. Extracted from the valerian root.",
            keyTakeaways: ["Stench", "Valerian root", "Sedative derivatives"],
            historicContext: HistoricContext(discoverer: "Pentz", year: 1830, impact: "Sedative studies."),
            funFact: "Its name comes from the Valerian plant, but it smells like sweaty gym socks.",
            synthesisRoutes: [
                SynthesisRoute(name: "Oxidation", description: "Oxidation of valeraldehyde.", reactants: "Valeraldehyde + O₂", conditions: "Catalyst")
            ],
            chemClass: "Carboxylic Acids"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Caproic Acid",
            formula: "C₆H₁₂O₂",
            family: .biomolecule,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 116.16,
            bondEnergy: 1170,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.O, 1.10, -0.60, 0.00),
            A(.H, 1.80, -0.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.C, -2.60, 0.00, 0.00),
            A(.C, -3.90, -0.70, 0.00),
            A(.C, -5.20, 0.00, 0.00),
            A(.C, -6.50, -0.70, 0.00),
            A(.H, -1.30, -1.31, -0.90),
            A(.H, -1.30, -1.31, 0.90),
            A(.H, -2.60, 0.61, -0.90),
            A(.H, -2.60, 0.61, 0.90),
            A(.H, -3.90, -1.31, -0.90),
            A(.H, -3.90, -1.31, 0.90),
            A(.H, -5.20, 0.61, 0.90),
            A(.H, -5.20, 0.61, -0.90),
            A(.H, -7.25, -0.08, 0.50),
            A(.H, -6.81, -0.88, -1.03),
            A(.H, -6.40, -1.65, 0.53)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4), B(4, 5), B(5, 6), B(6, 7), B(7, 8), 
            B(4, 9), B(4, 10), B(5, 11), B(5, 12), B(6, 13), B(6, 14), B(7, 15), B(7, 16), 
            B(8, 17), B(8, 18), B(8, 19)
        ],
            labMission: "Hexanoic acid. The distinct smell of goats.",
            keyTakeaways: ["Goat smell", "Gingko fruit", "Fatty acid"],
            historicContext: HistoricContext(discoverer: "Chevreul", year: 1818, impact: "Fatty acid classification."),
            funFact: "Named after 'Capra', the Latin word for goat, because... well, smell it.",
            synthesisRoutes: [
                SynthesisRoute(name: "Oxidation", description: "Oxidation of hexanal.", reactants: "Hexanal + O₂", conditions: "Catalyst")
            ],
            chemClass: "Carboxylic Acids"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Oxalic Acid",
            formula: "C₂H₂O₄",
            family: .highEnergy,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 90.03,
            bondEnergy: 1200,
            atoms: [
                A(.C, 0, 0, 0), A(.O, 0, 1.2, 0), A(.O, 1.1, -0.6, 0), A(.H, 1.8, -0.2, 0), 
                A(.C, -1.5, 0, 0), A(.O, -1.5, 1.2, 0), A(.O, -2.6, -0.6, 0), A(.H, -3.3, -0.2, 0) 
            ],
            bonds: [B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4), B(4, 5, 2), B(4, 6), B(6, 7)],
            labMission: "A dicarboxylic acid found in rhubarb leaves that bonds to calcium.",
            keyTakeaways: ["Kidney stones", "Rust remover", "Rhubarb"],
            historicContext: HistoricContext(discoverer: "Scheele", year: 1776, impact: "Isolated from sorrel."),
            funFact: "Eating too many rhubarb leaves can be fatal because this acid steals calcium from your blood.",
            synthesisRoutes: [
                SynthesisRoute(name: "Oxidation", description: "Nitric acid oxidation of carbohydrates.", reactants: "Sugar + HNO₃", conditions: "Heat")
            ],
            chemClass: "Carboxylic Acids"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Lactic Acid",
            formula: "C₃H₆O₃",
            family: .biomolecule,
            hybridization: .sp3,
            bondType: .covalent,
            molarMass: 90.08,
            bondEnergy: 1180,
            atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.O, 0.00, 1.20, 0.00),
            A(.O, 1.10, -0.60, 0.00),
            A(.H, 1.80, -0.20, 0.00),
            A(.C, -1.30, -0.70, 0.00),
            A(.O, -1.30, -2.00, 0.00),
            A(.H, -0.80, -2.40, 0.00),
            A(.C, -2.60, 0.00, 0.00),
            A(.H, -1.30, -0.66, -1.09),
            A(.H, -3.38, -0.69, 0.32),
            A(.H, -2.82, 0.36, -1.00),
            A(.H, -2.56, 0.84, 0.69)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4), B(4, 5), B(5, 6), B(4, 7), B(4, 8), 
            B(7, 9), B(7, 10), B(7, 11)
        ],
            labMission: "The burn of exercise. A byproduct of anaerobic metabolism.",
            keyTakeaways: ["Muscle fatigue", "Fermentation", "Chiral"],
            historicContext: HistoricContext(discoverer: "Scheele", year: 1780, impact: "Found in sour milk."),
            funFact: "It's what makes sourdough bread taste sour and yogurt tangy.",
            synthesisRoutes: [
                SynthesisRoute(name: "Fermentation", description: "Bacterial fermentation of glucose.", reactants: "Glucose", conditions: "Lactobacillus")
            ],
            chemClass: "Carboxylic Acids"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Pyridine",
            formula: "C₅H₅N",
            family: .aromatic,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 79.10,
            bondEnergy: 480,
            atoms: [
            A(.N, 1.40, 0.00, 0.00),
            A(.C, 0.70, 1.20, 0.00),
            A(.C, -0.70, 1.20, 0.00),
            A(.C, -1.40, 0.00, 0.00),
            A(.C, -0.70, -1.20, 0.00),
            A(.C, 0.70, -1.20, 0.00),
            A(.H, 1.24, 2.15, 0.00),
            A(.H, -1.24, 2.15, 0.00),
            A(.H, -2.49, 0.00, -0.00),
            A(.H, -1.24, -2.15, -0.00),
            A(.H, 1.24, -2.15, 0.00)
        ],
            bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0), B(1, 6), B(2, 7), 
            B(3, 8), B(4, 9), B(5, 10)
        ],
            labMission: "Benzene with a nitrogen substitution. A fishy-smelling base.",
            keyTakeaways: ["Heterocycle", "Weak base", "Solvent"],
            historicContext: HistoricContext(discoverer: "Anderson", year: 1849, impact: "Isolated from bone oil."),
            funFact: "It is added to ethanol to make it undrinkable (denatured alcohol).",
            synthesisRoutes: [
                 SynthesisRoute(name: "Chichibabin Synthesis", description: "Cyclization of aldehydes and ammonia.", reactants: "Aldehyde + NH₃", conditions: "Catalyst")
            ],
            chemClass: "Aromatics"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Nitrogen Dioxide",
            formula: "NO₂",
            family: .inorganic,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 46.01,
            bondEnergy: 400,
            atoms: [
            A(.N, 0.00, 0.00, 0.00),
            A(.O, 1.20, 0.50, 0.00),
            A(.O, -1.20, 0.50, 0.00)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2)
        ], 
            labMission: "A poisonous brown gas that creates smog and acid rain.",
            keyTakeaways: ["Smog", "Acid rain", "Paramagnetic"],
            historicContext: HistoricContext(discoverer: "Priestley", year: 1772, impact: "Early air analysis."),
            funFact: "It is paramagnetic because it has an unpaired electron (free radical).",
            synthesisRoutes: [
                SynthesisRoute(name: "Oxidation", description: "Oxidation of Nitric Oxide.", reactants: "2NO + O₂ → 2NO₂", conditions: "Ambient")
            ],
            chemClass: "Inorganic"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Sulfur Dioxide",
            formula: "SO₂",
            family: .inorganic,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 64.07,
            bondEnergy: 500,
            atoms: [
                A(.S, 0, 0, 0),
                A(.O, 1.4, -0.5, 0), A(.O, -1.4, -0.5, 0)
            ],
            bonds: [B(0, 1, 2), B(0, 2, 2)],
            labMission: "The smell of burnt matches. A volcanic gas used to preserve wine.",
            keyTakeaways: ["Volcanic gas", "Preservative", "Bent shape"],
            historicContext: HistoricContext(discoverer: "Priestley", year: 1774, impact: "Defined properties."),
            funFact: "It is released by volcanoes and suppresses global warming by reflecting sunlight.",
            synthesisRoutes: [
                SynthesisRoute(name: "Combustion", description: "Burning sulfur.", reactants: "S + O₂ → SO₂", conditions: "Heat")
            ],
            chemClass: "Inorganic"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Boron Trifluoride",
            formula: "BF₃",
            family: .inorganic,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 67.81,
            bondEnergy: 600,
            atoms: [
                A(.B, 0, 0, 0),
                A(.F, 0, 1.3, 0), A(.F, 1.1, -0.65, 0), A(.F, -1.1, -0.65, 0) 
            ],
            bonds: [B(0, 1), B(0, 2), B(0, 3)],
            labMission: "A classic Lewis acid with a flat, triangular shape.",
            keyTakeaways: ["Lewis acid", "Trigonal planar", "Electron deficient"],
            historicContext: HistoricContext(discoverer: "Gay-Lussac", year: 1809, impact: "Understanding valence."),
            funFact: "It violently fumes in moist air because it is so desperate for electrons from water.",
            synthesisRoutes: [
                SynthesisRoute(name: "Inorganic Synthesis", description: "Reaction of boron oxides with HF.", reactants: "B₂O₃ + HF", conditions: "Heat")
            ],
            chemClass: "Inorganic"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Xenon Tetrafluoride",
            formula: "XeF₄",
            family: .inorganic,
            hybridization: .sp3d2,
            bondType: .covalent,
            molarMass: 207.29,
            bondEnergy: 200,
            atoms: [
                A(.Xe, 0, 0, 0),
                A(.F, 1.4, 1.4, 0), A(.F, 1.4, -1.4, 0), A(.F, -1.4, 1.4, 0), A(.F, -1.4, -1.4, 0) 
            ],
            bonds: [B(0, 1), B(0, 2), B(0, 3), B(0, 4)],
            labMission: "An 'impossible' compound made from a noble gas.",
            keyTakeaways: ["Noble gas compound", "Square planar", "Hypervalent"],
            historicContext: HistoricContext(discoverer: "Claassen/Holloway", year: 1962, impact: "Broke the 'noble gases don't react' rule."),
            funFact: "Before 1962, textbooks said noble gases were completely inert. XeF4 proved them wrong.",
            synthesisRoutes: [
                SynthesisRoute(name: "Direct Combination", description: "Heating xenon and fluorine.", reactants: "Xe + 2F₂", conditions: "400°C, 6 atm")
            ],
            chemClass: "Inorganic"
        ).toMolecule(),

        MoleculeDefinition(
            name: "Ozone",
            formula: "O₃",
            family: .inorganic,
            hybridization: .sp2,
            bondType: .covalent,
            molarMass: 48.00,
            bondEnergy: 300,
            atoms: [
            A(.O, 0.00, 0.50, 0.00),
            A(.O, 1.10, -0.50, 0.00),
            A(.O, -1.10, -0.50, 0.00)
        ],
            bonds: [
            B(0, 1, 2), B(0, 2)
        ], 
            labMission: "The shield of Earth. A reactive allotrope of oxygen.",
            keyTakeaways: ["UV Shield", "Smog", "Allotrope"],
            historicContext: HistoricContext(discoverer: "Schonbein", year: 1840, impact: "Atmospheric science."),
            funFact: "It smells like chlorine or 'electricity' after a lightning storm.",
             synthesisRoutes: [
                SynthesisRoute(name: "Electric Discharge", description: "Corona discharge in oxygen.", reactants: "3O₂ → 2O₃", conditions: "High Voltage")
            ],
            chemClass: "Inorganic"
        ).toMolecule()
    ]


    static let methanol = MoleculeDefinition(
        name: "Methanol",
        formula: "CH₃OH",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 32.04,
        bondEnergy: 380,
        atoms: [
            A(.C, 0, 0, 0),
            A(.O, 1.43, 0, 0),
            A(.H, 1.8, 0.96, 0),
            A(.H, -0.5, 1.0, 0), A(.H, -0.5, -0.5, 0.8), A(.H, -0.5, -0.5, -0.8)
        ],
        bonds: [B(0, 1), B(1, 2), B(0, 3), B(0, 4), B(0, 5)],
        labMission: "Synthesize the simplest alcohol - a volatile feedstock for industrial energy and a precursor to formaldehyde synthesis.",
        keyTakeaways: ["High toxicity", "Industrial solvent", "Fuel source"],
        historicContext: HistoricContext(discoverer: "Robert Boyle", year: 1661, impact: "Isolated via distillation of boxwood, termed 'spirit of box'."),
        funFact: "Methanol burns with a ghostly invisible flame, making it a phantom hazard in high-performance racing.",
        synthesisRoutes: [
            SynthesisRoute(name: "Syngas Catalysis", description: "Catalytic hydrogenation of carbon monoxide.", reactants: "CO + 2H₂", conditions: "250°C, 50-100 atm, Cu/ZnO/Al₂O₃")
        ],
        chemClass: "Alcohols"
    ).toMolecule()

    static let ethanol = MoleculeDefinition(
        name: "Ethanol",
        formula: "C₂H₅OH",
        family: .biomolecule,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 46.07,
        bondEnergy: 400,
        atoms: [
            A(.C, 0, 0, 0),
            A(.C, 1.5, 0, 0),
            A(.O, 2.3, 1.2, 0),
            A(.H, 3.2, 1.0, 0),
            A(.H, 1.5, -0.6, 0.9), A(.H, 1.5, -0.6, -0.9),
            A(.H, -0.5, 0.9, 0), A(.H, -0.5, -0.5, 0.9), A(.H, -0.5, -0.5, -0.9)
        ],
        bonds: [B(0, 1), B(1, 2), B(2, 3), B(1, 4), B(1, 5), B(0, 6), B(0, 7), B(0, 8)],
        labMission: "A psychoactive prime mover. Capable of modulating GABAergic systems and powering internal combustion.",
        keyTakeaways: ["Biofuel", "Antiseptic", "Psychoactive"],
        historicContext: HistoricContext(discoverer: "Alchemists", year: 1100, impact: "Used for millennia; purified by distillation in the 12th century."),
        funFact: "Ethanol is the only alcohol that humans can metabolize in significant quantities without immediate toxicity.",
        synthesisRoutes: [
            SynthesisRoute(name: "Fermentation", description: "Biological conversion of sugars by yeast.", reactants: "C₆H₁₂O₆ → 2C₂H₅OH + 2CO₂", conditions: "30-40°C, Yeast"),
            SynthesisRoute(name: "Hydration of Ethene", description: "Acid-catalyzed addition of water to ethylene.", reactants: "C₂H₄ + H₂O", conditions: "300°C, 60-70 atm, H₃PO₄")
        ],
        chemClass: "Alcohols"
    ).toMolecule()

    static let propanol = MoleculeDefinition(
        name: "1-Propanol",
        formula: "C₃H₈O",
        family: .medicinal,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 60.10,
        bondEnergy: 420,
        atoms: [
            A(.C, 0, 0, 0),
            A(.C, 1.5, 0, 0),
            A(.C, 2.2, 1.3, 0),
            A(.O, 3.6, 1.3, 0),
            A(.H, 4.0, 0.5, 0),
            A(.H, 0, 1.1, 0), A(.H, -0.5, -0.5, 0.9), A(.H, -0.5, -0.5, -0.9),
            A(.H, 1.5, -0.6, 0.9), A(.H, 1.5, -0.6, -0.9),
            A(.H, 1.8, 1.9, 0.9), A(.H, 1.8, 1.9, -0.9)
        ],
        bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4),
            B(0, 5), B(0, 6), B(0, 7),
            B(1, 8), B(1, 9),
            B(2, 10), B(2, 11)
        ],
        labMission: "A multi-purpose solvent chain. Extends the carbon backbone to increase lipophilicity.",
        keyTakeaways: ["Primary alcohol", "Solvent", "Fuel additive"],
        historicContext: HistoricContext(discoverer: "Gustave Chancel", year: 1853, impact: "Isolated from fusel oil."),
        funFact: "It has a higher octane number than gasoline, making it a high-performance engine fuel.",
        synthesisRoutes: [
            SynthesisRoute(name: "Hydroformylation", description: "Hydrogenation of propionaldehyde formed from ethene.", reactants: "C₂H₄ + CO + H₂ → C₂H₅CHO → C₃H₇OH", conditions: "Rh/Co catalyst")
        ],
        chemClass: "Alcohols"
    ).toMolecule()

    static let isopropanol = MoleculeDefinition(
        name: "Isopropanol",
        formula: "C₃H₈O",
        family: .medicinal,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 60.10,
        bondEnergy: 410,
        atoms: [
            A(.C, 0, 0, 0),
            A(.C, 1.5, 0, 0),
            A(.C, -0.8, 1.3, 0),
            A(.O, -0.5, -1.0, 0),
            A(.H, 0.2, -1.8, 0),
            A(.H, 0, 0, 1.1),
            A(.H, 1.5, 0.6, 0.9), A(.H, 1.5, 0.6, -0.9), A(.H, 2.1, -0.9, 0),
            A(.H, -0.5, 1.9, 0.9), A(.H, -0.5, 1.9, -0.9), A(.H, -1.8, 1.1, 0)
        ],
        bonds: [
            B(0, 1), B(0, 2), B(0, 3),
            B(3, 4), B(0, 5),
            B(1, 6), B(1, 7), B(1, 8),
            B(2, 9), B(2, 10), B(2, 11)
        ],
        labMission: "The universal disinfectant. A secondary alcohol optimized for membrane disruption and rapid evaporation.",
        keyTakeaways: ["Rubbing alcohol", "Secondary alcohol", "Disinfectant"],
        historicContext: HistoricContext(discoverer: "Standard Oil", year: 1920, impact: "First petrochemical produced from propene."),
        funFact: "Rapidly evaporates, cooling the skin by extracting thermal energy during phase transition.",
        synthesisRoutes: [
            SynthesisRoute(name: "Propene Hydration", description: "Direct hydration of propene.", reactants: "C₃H₆ + H₂O", conditions: "High Pressure, Acid Catalyst")
        ],
        chemClass: "Alcohols"
    ).toMolecule()

    static let butanol = MoleculeDefinition(
        name: "1-Butanol",
        formula: "C₄H₁₀O",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 74.12,
        bondEnergy: 450,
        atoms: [
            A(.C, 0, 0, 0), A(.C, 1.5, 0, 0), A(.C, 2.2, 1.3, 0), A(.C, 3.7, 1.3, 0),
            A(.O, 4.4, 0, 0), A(.H, 5.3, 0, 0),
            A(.H, -0.5, 1.0, 0), A(.H, -0.5, -0.5, 0.9), A(.H, -0.5, -0.5, -0.9),
            A(.H, 1.5, -0.6, 0.9), A(.H, 1.5, -0.6, -0.9),
            A(.H, 2.2, 1.9, 0.9), A(.H, 2.2, 1.9, -0.9),
            A(.H, 3.7, 1.9, 0.9), A(.H, 3.7, 1.9, -0.9)
        ],
        bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5),
            B(0, 6), B(0, 7), B(0, 8),
            B(1, 9), B(1, 10),
            B(2, 11), B(2, 12),
            B(3, 13), B(3, 14)
        ],
        labMission: "A four-carbon biofuel candidate. Offers energy density comparable to gasoline without the corrosion.",
        keyTakeaways: ["Biofuel", "Industrial solvent", "Vanilla scent note"],
        historicContext: HistoricContext(discoverer: "Louis Pasteur", year: 1861, impact: "Discovered fermentation process to produce butanol."),
        funFact: "Used as a base for artificial fruit flavorings like banana and melon.",
        synthesisRoutes: [
            SynthesisRoute(name: "Oxo Process", description: "Hydroformylation of propylene followed by hydrogenation.", reactants: "C₃H₆ + CO + H₂ → C₃H₇CHO → C₄H₉OH", conditions: "Rh/Co Catalyst")
        ],
        chemClass: "Alcohols"
    ).toMolecule()

    static let phenol = MoleculeDefinition(
        name: "Phenol",
        formula: "C₆H₅OH",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 94.11,
        bondEnergy: 5000,
        atoms: [
            A(.C, 1.4, 0, 0), A(.C, 0.7, 1.2, 0), A(.C, -0.7, 1.2, 0),
            A(.C, -1.4, 0, 0), A(.C, -0.7, -1.2, 0), A(.C, 0.7, -1.2, 0),
            A(.O, 2.8, 0, 0), A(.H, 3.4, 0.8, 0),
            A(.H, 1.2, 2.15, 0), A(.H, -1.2, 2.15, 0),
            A(.H, -2.5, 0, 0), A(.H, -1.2, -2.15, 0), A(.H, 1.2, -2.15, 0)
        ],
        bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0),
            B(0, 6), B(6, 7),
            B(1, 8), B(2, 9), B(3, 10), B(4, 11), B(5, 12)
        ],
        labMission: "A crystal of antiseptic power, bridging the gap between alcohols and acids.",
        keyTakeaways: ["Mildly acidic", "Antiseptic properties", "Precursor to plastics"],
        historicContext: HistoricContext(discoverer: "Friedlieb Ferdinand Runge", year: 1834, impact: "Revolutionized surgery via Lister."),
        funFact: "Used to be called 'Carbolic Acid' and was the first widely used antiseptic spray.",
        synthesisRoutes: [
            SynthesisRoute(name: "Cumene Process", description: "Oxidation of cumene followed by cleavage.", reactants: "C₆H₅CH(CH₃)₂ + O₂", conditions: "Air oxidation, Acid cleavage")
        ],
        chemClass: "Alcohols"
    ).toMolecule()

    static let dimethylEther = MoleculeDefinition(
        name: "Dimethyl Ether",
        formula: "C₂H₆O",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 46.07,
        bondEnergy: 348,
        atoms: [
            A(.O, 0, 0, 0),
            A(.C, 1.3, 0.5, 0), A(.C, -1.3, 0.5, 0),
            A(.H, 1.3, 1.6, 0), A(.H, 1.8, 0.1, 0.9), A(.H, 1.8, 0.1, -0.9),
            A(.H, -1.3, 1.6, 0), A(.H, -1.8, 0.1, 0.9), A(.H, -1.8, 0.1, -0.9)
        ],
        bonds: [
            B(0, 1), B(0, 2),
            B(1, 3), B(1, 4), B(1, 5),
            B(2, 6), B(2, 7), B(2, 8)
        ],
        labMission: "A gaseous propellant and clean-burning diesel alternative. The simplest ether bridge.",
        keyTakeaways: ["Aerosol propellant", "Clean fuel", "Isomer of ethanol"],
        historicContext: HistoricContext(discoverer: "Jean-Baptiste Dumas", year: 1835, impact: "Determined its empirical formula."),
        funFact: "Used to freeze warts in cryotherapy due to its low boiling point (-24°C).",
        synthesisRoutes: [
            SynthesisRoute(name: "Methanol Dehydration", description: "Acid-catalyzed dehydration of methanol.", reactants: "2CH₃OH → CH₃OCH₃ + H₂O", conditions: "Acid Catalyst, Heat")
        ],
        chemClass: "Ethers"
    ).toMolecule()

    static let diethylEther = MoleculeDefinition(
        name: "Diethyl Ether",
        formula: "C₄H₁₀O",
        family: .medicinal,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 74.12,
        bondEnergy: 360,
        atoms: [
            A(.O, 0, 0.5, 0),

            A(.C, -1.2, -0.2, 0), A(.C, -2.4, 0.5, 0),

            A(.C, 1.2, -0.2, 0), A(.C, 2.4, 0.5, 0),

            A(.H, -1.2, -1.3, 0), A(.H, -1.2, 0, 1.0), 
            A(.H, -2.4, 1.6, 0), A(.H, -3.3, 0, 0), A(.H, -2.4, 0.5, 1.0),
            A(.H, 1.2, -1.3, 0), A(.H, 1.2, 0, 1.0),
            A(.H, 2.4, 1.6, 0), A(.H, 3.3, 0, 0), A(.H, 2.4, 0.5, 1.0)
        ],
        bonds: [
            B(0, 1), B(1, 2),
            B(0, 3), B(3, 4),
            B(1, 5), B(1, 6),
            B(2, 7), B(2, 8), B(2, 9),
            B(3, 10), B(3, 11),
            B(4, 12), B(4, 13), B(4, 14)
        ],
        labMission: "The 'Sweet Oil of Vitriol'. A volatile anesthetic that opened the door to painless surgery.",
        keyTakeaways: ["First anesthetic", "Highly flammable", "Peroxide former"],
        historicContext: HistoricContext(discoverer: "Valerius Cordus", year: 1540, impact: "Revolutionized medicine by enabling anesthesia."),
        funFact: "Historically consumed as a recreational drug during the 'ether frolics' of the 19th century.",
        synthesisRoutes: [
            SynthesisRoute(name: "Ethanol Dehydration", description: "Acid-catalyzed dehydration of ethanol.", reactants: "2C₂H₅OH → (C₂H₅)₂O + H₂O", conditions: "140°C, H₂SO₄")
        ],
        chemClass: "Ethers"
    ).toMolecule()

    static let thf = MoleculeDefinition(
        name: "Tetrahydrofuran",
        formula: "C₄H₈O",
        family: .highEnergy, 
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 72.11,
        bondEnergy: 360,
        atoms: [
            A(.O, 0, 1.2, 0),
            A(.C, 1.1, 0.4, 0), A(.C, 0.7, -1.1, 0.2),
            A(.C, -0.7, -1.1, -0.2), A(.C, -1.1, 0.4, 0),

            A(.H, 1.8, 0.6, 0.8), A(.H, 1.6, 0.6, -0.8),
            A(.H, 1.1, -1.6, -0.5), A(.H, 0.8, -1.3, 1.2),
            A(.H, -0.8, -1.3, -1.2), A(.H, -1.1, -1.6, 0.5),
            A(.H, -1.6, 0.6, -0.8), A(.H, -1.8, 0.6, 0.8)
        ],
        bonds: [B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 0), B(1, 5), B(1, 6), B(2, 7), B(2, 8), B(3, 9), B(3, 10), B(4, 11), B(4, 12)],
        labMission: "A cyclic ether solvent, vital for dissolving polymers and facilitating reactions.",
        keyTakeaways: ["Cyclic ether", "Polar aprotic", "Polymer solvent"],
        historicContext: HistoricContext(discoverer: "Industrial Era", year: 1900, impact: "Standard solvent for PVC and varnishes."),
        funFact: "It can penatrate human skin rapidly, carrying other dissolved chemicals with it.",
        synthesisRoutes: [
            SynthesisRoute(name: "Butanediol Dehydration", description: "Acid-catalyzed cyclization of 1,4-butanediol.", reactants: "HO(CH₂)₄OH → C₄H₈O + H₂O", conditions: "Acid Catalyst, Heat")
        ],
        chemClass: "Ethers"
    ).toMolecule()

    static let anisole = MoleculeDefinition(
        name: "Anisole",
        formula: "CH₃OC₆H₅",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 108.14,
        bondEnergy: 400,
        atoms: [

            A(.C, 0, 0, 0), A(.C, 1.4, 0, 0), A(.C, 2.1, 1.2, 0),
            A(.C, 1.4, 2.4, 0), A(.C, 0, 2.4, 0), A(.C, -0.7, 1.2, 0),

            A(.O, 3.5, 1.2, 0), A(.C, 4.3, 2.4, 0),

            A(.H, 4.3, 2.8, 1.0), A(.H, 4.3, 2.8, -1.0), A(.H, 5.3, 2.0, 0),
            A(.H, -0.5, -0.9, 0), A(.H, 1.9, -0.9, 0), A(.H, -1.7, 1.2, 0), A(.H, -0.5, 3.3, 0), A(.H, 1.9, 3.3, 0)
        ],
        bonds: [B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0), B(2, 6), B(6, 7), B(7, 8), B(7, 9), B(7, 10), B(0, 11), B(1, 12), B(5, 13), B(4, 14), B(3, 15)],
        labMission: "Methodybenzene. An endless pleasant aroma found in anise seed.",
        keyTakeaways: ["Anise scent", "Ether", "Insect pheromone"],
        historicContext: HistoricContext(discoverer: "Cahours", year: 1841, impact: "Precursor to perfumes and pharmaceuticals."),
        funFact: "It smells distinctively like anise or licorice.",
        synthesisRoutes: [
            SynthesisRoute(name: "Williamson Ether Synthesis", description: "Reaction of sodium phenoxide with methyl iodide.", reactants: "C₆H₅ONa + CH₃I → C₆H₅OCH₃ + NaI", conditions: "Reflux")
        ],
        chemClass: "Ethers"
    ).toMolecule()

    static let dioxane = MoleculeDefinition(
        name: "1,4-Dioxane",
        formula: "C₄H₈O₂",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 88.11,
        bondEnergy: 350,
        atoms: [
            A(.O, 0, 1.4, 0), A(.C, 1.2, 0.7, 0.3), A(.C, 1.2, -0.7, -0.3),
            A(.O, 0, -1.4, 0), A(.C, -1.2, -0.7, 0.3), A(.C, -1.2, 0.7, -0.3),

            A(.H, 1.3, 0.8, 1.4), A(.H, 2.1, 1.0, -0.1),
            A(.H, 1.3, -0.8, -1.4), A(.H, 2.1, -1.0, 0.1),
            A(.H, -1.3, -0.8, 1.4), A(.H, -2.1, -1.0, -0.1),
            A(.H, -1.3, 0.8, -1.4), A(.H, -2.1, 1.0, 0.1)
        ],
        bonds: [B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 0), B(1, 6), B(1, 7), B(2, 8), B(2, 9), B(4, 10), B(4, 11), B(5, 12), B(5, 13)],
        labMission: "A cyclic diether used as a stabilizer for chlorinated solvents.",
        keyTakeaways: ["Cyclic ether", "Solvent stabilizer", "Carcinogen"],
        historicContext: HistoricContext(discoverer: "Early Industrialists", year: 1950, impact: "Stabilizer for 1,1,1-trichloroethane transport."),
        funFact: "Often found as a trace contaminant in cosmetics and shampoos.",
        synthesisRoutes: [
            SynthesisRoute(name: "Diethylene Glycol Dehydration", description: "Acid-catalyzed dehydration.", reactants: "HO(CH₂)₂O(CH₂)₂OH", conditions: "Acid Catalyst, Heat")
        ],
        chemClass: "Ethers"
    ).toMolecule()

    static let methane = MoleculeDefinition(
        name: "Methane",
        formula: "CH₄",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 16.04,
        bondEnergy: 413,
        atoms: [
            A(.C, 0, 0, 0),
            A(.H, 0.63, 0.63, 0.63), A(.H, -0.63, -0.63, 0.63),
            A(.H, -0.63, 0.63, -0.63), A(.H, 0.63, -0.63, -0.63)
        ],
        bonds: [B(0, 1), B(0, 2), B(0, 3), B(0, 4)],
        labMission: "The genesis of hydrocarbons. A primordial fuel source harvested from the depths of planetary decay.",
        keyTakeaways: ["Greenhouse gas", "Simplest alkane", "Blue flame"],
        historicContext: HistoricContext(discoverer: "Alessandro Volta", year: 1776, impact: "Isolated from marsh gas, sparking the hydrocarbon revolution."),
        funFact: "Titan, Saturn's largest moon, has rivers and lakes of liquid methane.",
        synthesisRoutes: [
             SynthesisRoute(name: "Sabatier Reaction", description: "Reaction of hydrogen with carbon dioxide at elevated temperatures.", reactants: "CO₂ + 4H₂", conditions: "300-400°C, Ni catalyst")
        ],
        chemClass: "Alkanes"
    ).toMolecule()

    static let ethane = MoleculeDefinition(
        name: "Ethane",
        formula: "C₂H₆",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 30.07,
        bondEnergy: 377,
        atoms: [
            A(.C, -0.75, 0, 0), A(.C, 0.75, 0, 0),
            A(.H, -1.1, 1.0, 0), A(.H, -1.1, -0.5, 0.9), A(.H, -1.1, -0.5, -0.9),
            A(.H, 1.1, 1.0, 0), A(.H, 1.1, -0.5, 0.9), A(.H, 1.1, -0.5, -0.9)
        ],
        bonds: [B(0, 1), B(0, 2), B(0, 3), B(0, 4), B(1, 5), B(1, 6), B(1, 7)],
        labMission: "The second step in the carbon ladder. A clean-burning feedstock for ethylene production.",
        keyTakeaways: ["Natural gas component", "Ethylene precursor", "Odorless gas"],
        historicContext: HistoricContext(discoverer: "Michael Faraday", year: 1834, impact: "Electrolyzed acetates to release this gas."),
        funFact: "Global ethane concentrations serve as a tracker for oil and gas drilling activity.",
        synthesisRoutes: [
            SynthesisRoute(name: "Natural Gas Processing", description: "Separated from natural gas via cryogenic distillation.", reactants: "Natural Gas Mixture", conditions: "Cryogenic Temperatures")
        ],
        chemClass: "Alkanes"
    ).toMolecule()

    static let propane = MoleculeDefinition(
        name: "Propane",
        formula: "C₃H₈",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 44.10,
        bondEnergy: 370,
        atoms: [
            A(.C, -1.2, 0, 0), A(.C, 0, 0.8, 0), A(.C, 1.2, 0, 0),
            A(.H, -1.2, -1.1, 0), A(.H, -1.6, 0.3, 0.9), A(.H, -1.6, 0.3, -0.9),
            A(.H, 0, 1.9, 0), A(.H, 0, 0.8, 1.1),
            A(.H, 1.2, -1.1, 0), A(.H, 1.6, 0.3, 0.9), A(.H, 1.6, 0.3, -0.9)
        ],
        bonds: [B(0, 1), B(1, 2), B(0, 3), B(0, 4), B(0, 5), B(1, 6), B(1, 7), B(2, 8), B(2, 9), B(2, 10)],
        labMission: "Portable energy for the modern nomad. Compressed liquid power for heat and propulsion.",
        keyTakeaways: ["LPG fuel", "Clean burning", "Three-carbon chain"],
        historicContext: HistoricContext(discoverer: "Walter Snelling", year: 1910, impact: "Identified as the volatile component in gasoline."),
        funFact: "Propane is naturally odorless; the 'gas smell' is an additive called ethanethiol.",
        synthesisRoutes: [
            SynthesisRoute(name: "Petroleum Refining", description: "Recovered during crude oil distillation.", reactants: "Crude Oil", conditions: "Fractional Distillation")
        ],
        chemClass: "Alkanes"
    ).toMolecule()

    static let butane = MoleculeDefinition(
        name: "Butane",
        formula: "C₄H₁₀",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 58.12,
        bondEnergy: 365,
        atoms: [
            A(.C, -2.1, 0, 0), A(.C, -0.7, 0.9, 0), A(.C, 0.7, 0, 0), A(.C, 2.1, 0.9, 0),
            A(.H, -2.1, -1.1, 0), A(.H, -2.5, 0.3, 0.9), A(.H, -2.5, 0.3, -0.9),
            A(.H, -0.7, 2.0, 0), A(.H, -0.7, 0.9, 1.1),
            A(.H, 0.7, -1.1, 0), A(.H, 0.7, 0, 1.1),
            A(.H, 2.1, 2.0, 0), A(.H, 2.5, 0.3, 0.9), A(.H, 2.5, 0.3, -0.9)
        ],
        bonds: [B(0, 1), B(1, 2), B(2, 3), B(0, 4), B(0, 5), B(0, 6), B(1, 7), B(1, 8), B(2, 9), B(2, 10), B(3, 11), B(3, 12), B(3, 13)],
        labMission: "The lighter fluid of civilization. Highly flammable liquid under slight pressure.",
        keyTakeaways: ["Lighter fluid", "Isomerism", "Fuel gas"],
        historicContext: HistoricContext(discoverer: "Edward Frankland", year: 1849, impact: "First synthesis of this four-carbon alkane."),
        funFact: "Butane torches can reach temperatures up to 1,430°C, hot enough to melt aluminum.",
        synthesisRoutes: [
            SynthesisRoute(name: "Fractional Distillation", description: "Separation from crude oil or natural gas.", reactants: "Crude Oil / Natural Gas", conditions: "Pressure/Temperature separation")
        ],
        chemClass: "Alkanes"
    ).toMolecule()

    static let pentane = MoleculeDefinition(
        name: "Pentane",
        formula: "C₅H₁₂",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 72.15,
        bondEnergy: 350,
        atoms: [
            A(.C, -3.00, 0.00, 0.00),
            A(.C, -1.50, 0.80, 0.00),
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.50, 0.80, 0.00),
            A(.C, 3.00, 0.00, 0.00),
            A(.H, -3.50, -0.90, 0.00),
            A(.H, 3.50, -0.90, 0.00),
            A(.H, -3.38, 0.38, -0.95),
            A(.H, -3.38, 0.39, 0.95),
            A(.H, -1.50, 1.41, -0.90),
            A(.H, -1.50, 1.41, 0.90),
            A(.H, -0.00, -0.61, 0.90),
            A(.H, 0.00, -0.61, -0.90),
            A(.H, 1.50, 1.41, 0.90),
            A(.H, 1.50, 1.41, -0.90),
            A(.H, 3.38, 0.39, -0.95),
            A(.H, 3.38, 0.39, 0.95)
        ],
        bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(0, 5), B(4, 6), B(0, 7), B(0, 8), 
            B(1, 9), B(1, 10), B(2, 11), B(2, 12), B(3, 13), B(3, 14), B(4, 15), B(4, 16)
        ],
        labMission: "A five-carbon chain of liquid instability, eager to vaporize and combust.",
        keyTakeaways: ["Blowing agent", "Low boiling point", "Non-polar solvent"],
        historicContext: HistoricContext(discoverer: "Carl Schorlemmer", year: 1862, impact: "Identified structure of simple alkanes."),
        funFact: "Used as a blowing agent to create polystyrene foam for insulation and packaging.",
        synthesisRoutes: [
            SynthesisRoute(name: "Fractional Distillation", description: "Isolated from light hydrocarbon fractions.", reactants: "Naphtha", conditions: "Distillation")
        ],
        chemClass: "Alkanes"
    ).toMolecule()

    static let hexane = MoleculeDefinition(
        name: "Hexane",
        formula: "C₆H₁₄",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 86.18,
        bondEnergy: 360,
        atoms: [
            A(.C, -3.75, 0.00, 0.00),
            A(.C, -2.25, 0.80, 0.00),
            A(.C, -0.75, 0.00, 0.00),
            A(.C, 0.75, 0.80, 0.00),
            A(.C, 2.25, 0.00, 0.00),
            A(.C, 3.75, 0.80, 0.00),
            A(.H, -4.46, 0.57, -0.59),
            A(.H, -3.63, -1.00, -0.43),
            A(.H, -4.12, -0.09, 1.02),
            A(.H, -2.25, 1.41, 0.90),
            A(.H, -2.25, 1.41, -0.90),
            A(.H, -0.75, -0.61, 0.90),
            A(.H, -0.75, -0.61, -0.90),
            A(.H, 0.75, 1.41, 0.90),
            A(.H, 0.75, 1.41, -0.90),
            A(.H, 2.25, -0.61, -0.90),
            A(.H, 2.25, -0.61, 0.90),
            A(.H, 3.59, 1.88, -0.08),
            A(.H, 4.34, 0.46, -0.85),
            A(.H, 4.28, 0.58, 0.93)
        ],
        bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(0, 6), B(0, 7), B(0, 8), 
            B(1, 9), B(1, 10), B(2, 11), B(2, 12), B(3, 13), B(3, 14), B(4, 15), B(4, 16), 
            B(5, 17), B(5, 18), B(5, 19)
        ],
        labMission: "The standard backbone of industrial solvents, extracting oils from seeds and cleaning machinery.",
        keyTakeaways: ["Neurotoxin", "Non-polar", "Industrial cleaner"],
        historicContext: HistoricContext(discoverer: "Kekulé (Structural Theory)", year: 1860, impact: "Ideal straight-chain hydrocarbon model."),
        funFact: "Long-term exposure can cause nerve damage, leading to numbness in the extremities.",
        synthesisRoutes: [
             SynthesisRoute(name: "Petroleum Refining", description: "Isolated from crude oil fractions.", reactants: "Crude Oil", conditions: "Fractional Distillation")
        ]
    ).toMolecule()

    static let heptane = MoleculeDefinition(
        name: "Heptane",
        formula: "C₇H₁₆",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 100.21,
        bondEnergy: 370,
        atoms: [
            A(.C, -4.50, 0.80, 0.00),
            A(.C, -3.00, 0.00, 0.00),
            A(.C, -1.50, 0.80, 0.00),
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.50, 0.80, 0.00),
            A(.C, 3.00, 0.00, 0.00),
            A(.C, 4.50, 0.80, 0.00),
            A(.H, -4.70, 1.20, 0.99),
            A(.H, -4.48, 1.62, -0.72),
            A(.H, -5.29, 0.10, -0.27),
            A(.H, -3.00, -0.61, 0.90),
            A(.H, -3.00, -0.61, -0.90),
            A(.H, -1.50, 1.41, -0.90),
            A(.H, -1.50, 1.41, 0.90),
            A(.H, -0.00, -0.61, -0.90),
            A(.H, 0.00, -0.61, 0.90),
            A(.H, 1.50, 1.41, 0.90),
            A(.H, 1.50, 1.41, -0.90),
            A(.H, 3.00, -0.61, -0.90),
            A(.H, 3.00, -0.61, 0.90),
            A(.H, 4.42, 1.73, -0.57),
            A(.H, 4.79, 1.02, 1.03),
            A(.H, 5.25, 0.16, -0.46)
        ],
        bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(0, 7), B(0, 8), 
            B(0, 9), B(1, 10), B(1, 11), B(2, 12), B(2, 13), B(3, 14), B(3, 15), B(4, 16), 
            B(4, 17), B(5, 18), B(5, 19), B(6, 20), B(6, 21), B(6, 22)
        ],
        labMission: "The zero point of the octane rating scale. A straight chain that detonates violently under pressure.",
        keyTakeaways: ["Octane rating 0", "Standard fuel", "Knocking agent"],
        historicContext: HistoricContext(discoverer: "Edward Frankland", year: 1849, impact: "Isolated from pine oil."),
        funFact: "Because it causes engine knocking, pure heptane is the reference for '0 octane' fuel.",
        synthesisRoutes: [
            SynthesisRoute(name: "Jeffery Pine Distillation", description: "Historically isolated from pine trees.", reactants: "Pinus jeffreyi sap", conditions: "Distillation")
        ],
        chemClass: "Alkanes" 

    ).toMolecule()

    static let octane = MoleculeDefinition(
        name: "Octane",
        formula: "C₈H₁₈",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 114.23,
        bondEnergy: 380,
        atoms: [
            A(.C, -5.20, 0.00, 0.00),
            A(.C, -3.70, 0.80, 0.00),
            A(.C, -2.20, 0.00, 0.00),
            A(.C, -0.70, 0.80, 0.00),
            A(.C, 0.80, 0.00, 0.00),
            A(.C, 2.30, 0.80, 0.00),
            A(.C, 3.80, 0.00, 0.00),
            A(.C, 5.30, 0.80, 0.00),
            A(.H, -5.60, -0.90, 0.00),
            A(.H, 5.60, -0.90, 0.00),
            A(.H, -5.61, 0.38, 0.94),
            A(.H, -5.61, 0.38, -0.94),
            A(.H, -3.70, 1.41, 0.90),
            A(.H, -3.70, 1.41, -0.90),
            A(.H, -2.20, -0.61, -0.90),
            A(.H, -2.20, -0.61, 0.90),
            A(.H, -0.70, 1.41, -0.90),
            A(.H, -0.70, 1.41, 0.90),
            A(.H, 0.80, -0.61, 0.90),
            A(.H, 0.80, -0.61, -0.90),
            A(.H, 2.30, 1.41, 0.90),
            A(.H, 2.30, 1.41, -0.90),
            A(.H, 3.80, -0.61, -0.90),
            A(.H, 3.80, -0.61, 0.90),
            A(.H, 5.58, 1.38, -0.88),
            A(.H, 5.58, 1.38, 0.88)
        ],
        bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 7), B(0, 8), 
            B(7, 9), B(0, 10), B(0, 11), B(1, 12), B(1, 13), B(2, 14), B(2, 15), B(3, 16), 
            B(3, 17), B(4, 18), B(4, 19), B(5, 20), B(5, 21), B(6, 22), B(6, 23), B(7, 24), 
            B(7, 25)
        ],
        labMission: "The hydrocarbon standard. Describes the explosive resistance of your fuel.",
        keyTakeaways: ["Gasoline standard", "Flammable liquid", "Engine performance"],
        historicContext: HistoricContext(discoverer: "Petrochemical Industry", year: 1800, impact: "Reference point for anti-knock ratings."),
        funFact: "While 'High Octane' implies power, linear n-octane actually has a terrible octane rating of -20.",
        synthesisRoutes: [
            SynthesisRoute(name: "Petroleum Refining", description: "Direct isolation from alkane fraction.", reactants: "Crude Oil", conditions: "Fractional Distillation")
        ],
        chemClass: "Alkanes"
    ).toMolecule()

    static let isooctane = MoleculeDefinition(
        name: "Iso-octane",
        formula: "C₈H₁₈",
        family: .highEnergy,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 114.23,
        bondEnergy: 390,
        atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.50, 0.00, 0.00),
            A(.C, 3.00, 0.80, 0.00),
            A(.C, 4.50, 0.00, 0.00),
            A(.C, 3.00, -0.80, 0.00),
            A(.C, -1.20, 1.00, 0.00),
            A(.C, -1.20, -1.00, 0.00),
            A(.C, 1.00, -1.50, 0.50),
            A(.H, 0.27, -0.00, 1.06),
            A(.H, 1.46, 0.86, 0.67),
            A(.H, 3.00, 1.89, -0.00),
            A(.H, 4.37, -1.01, 0.39),
            A(.H, 5.20, 0.55, 0.63),
            A(.H, 4.88, -0.05, -1.02),
            A(.H, 4.01, -1.16, 0.21),
            A(.H, 2.67, -1.16, -0.97),
            A(.H, 2.32, -1.16, 0.77),
            A(.H, -1.97, 0.64, -0.69),
            A(.H, -1.61, 1.07, 1.01),
            A(.H, -0.85, 1.98, -0.32),
            A(.H, -0.92, -1.90, -0.54),
            A(.H, -1.46, -1.26, 1.03),
            A(.H, -2.06, -0.54, -0.49),
            A(.H, 1.51, -1.76, 1.43),
            A(.H, 1.24, -2.24, -0.27),
            A(.H, -0.08, -1.49, 0.67)
        ],
        bonds: [
            B(0, 1), B(1, 2), B(2, 3), B(2, 4), B(0, 5), B(0, 6), B(1, 7), B(0, 8), 
            B(1, 9), B(2, 10), B(3, 11), B(3, 12), B(3, 13), B(4, 14), B(4, 15), B(4, 16), 
            B(5, 17), B(5, 18), B(5, 19), B(6, 20), B(6, 21), B(6, 22), B(7, 23), B(7, 24), 
            B(7, 25)
        ],
        labMission: "The gold standard of combustion stability. Its branched structure resists premature detonation.",
        keyTakeaways: ["Octane rating 100", "Anti-knock", "Branched alkane"],
        historicContext: HistoricContext(discoverer: "Graham Edgar", year: 1927, impact: "Established the octane rating scale."),
        funFact: "This molecule is defined as '100 Octane' because it burns smoothly without knocking in engines.",
        synthesisRoutes: [
            SynthesisRoute(name: "Alkylation", description: "Reaction of isobutane with isobutylene.", reactants: "Isobutane + Isobutylene", conditions: "Acid Catalyst (HF or H₂SO₄)")
        ]
    ).toMolecule()

    static let ethene = MoleculeDefinition(
        name: "Ethene",
        formula: "C₂H₄",
        family: .polymer,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 28.05,
        bondEnergy: 610,
        atoms: [
            A(.C, -0.67, 0, 0), A(.C, 0.67, 0, 0),
            A(.H, -1.2, 0.9, 0), A(.H, -1.2, -0.9, 0),
            A(.H, 1.2, 0.9, 0), A(.H, 1.2, -0.9, 0)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(0, 3), B(1, 4), B(1, 5)],
        labMission: "The fruit-ripening hormone and the most produced organic compound on Earth.",
        keyTakeaways: ["Plant hormone", "Polyethylene monomer", "Double bond"],
        historicContext: HistoricContext(discoverer: "Johann Joachim Becher", year: 1669, impact: "Catalyzed the age of plastics."),
        funFact: "Bananas release ethene gas, which triggers nearby fruits to ripen faster.",
        synthesisRoutes: [
            SynthesisRoute(name: "Steam Cracking", description: "Thermal cracking of hydrocarbons.", reactants: "Naphtha / Ethane", conditions: "850°C, Steam")
        ],
        chemClass: "Alkenes"
    ).toMolecule()

    static let propene = MoleculeDefinition(
        name: "Propene",
        formula: "C₃H₆",
        family: .polymer,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 42.08,
        bondEnergy: 600,
        atoms: [
            A(.C, -1.3, 0, 0), A(.C, 0, 0, 0), A(.C, 1.4, 0.5, 0),
            A(.H, -1.8, 0.9, 0), A(.H, -1.8, -0.9, 0),
            A(.H, 0, -1.1, 0),
            A(.H, 1.4, 1.6, 0), A(.H, 1.9, 0, 0.9), A(.H, 1.9, 0, -0.9)
        ],
        bonds: [B(0, 1, 2), B(1, 2), B(0, 3), B(0, 4), B(1, 5), B(2, 6), B(2, 7), B(2, 8)],
        labMission: "A versatile monomer destined to become packaging, fibers, and structural plastics.",
        keyTakeaways: ["Polypropylene monomer", "Byproduct of refining", "Double bond"],
        historicContext: HistoricContext(discoverer: "Marcellin Berthelot", year: 1850, impact: "Second most important petrochemical."),
        funFact: "Often gathered from the 'cracking' of larger hydrocarbons in oil refineries.",
        synthesisRoutes: [
            SynthesisRoute(name: "Steam Cracking", description: "Byproduct of ethylene production.", reactants: "Naphtha", conditions: "High Temperature")
        ],
        chemClass: "Alkenes"
    ).toMolecule()

    static let butene = MoleculeDefinition(
        name: "But-1-ene",
        formula: "C₄H₈",
        family: .polymer,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 56.11,
        bondEnergy: 590,
        atoms: [
            A(.C, -2.1, 0, 0), A(.C, -0.8, -0.5, 0),
            A(.C, 0.6, 0, 0), A(.C, 2.0, -0.5, 0),
            A(.H, -2.6, 0.9, 0), A(.H, -2.6, -0.9, 0),
            A(.H, -0.4, -1.5, 0),
            A(.H, 0.6, 1.1, 0), A(.H, 0.6, -1.1, 0),
            A(.H, 2.0, -1.6, 0), A(.H, 2.5, 0, 0.9), A(.H, 2.5, 0, -0.9)
        ],
        bonds: [B(0, 1, 2), B(1, 2), B(2, 3), B(0, 4), B(0, 5), B(1, 6), B(2, 7), B(2, 8), B(3, 9), B(3, 10), B(3, 11)],
        labMission: "A gaseous co-monomer used to tune the density and flexibility of polyethylene.",
        keyTakeaways: ["Linear alpha olefin", "Polymer cleaner", "Fuel gas"],
        historicContext: HistoricContext(discoverer: "Michael Faraday", year: 1825, impact: "Key component in modern polymer blends."),
        funFact: "Its double bond makes it highly reactive, eager to link up into long chains.",
        synthesisRoutes: [
            SynthesisRoute(name: "Catalytic Cracking", description: "Cracking of C4 hydrocarbons.", reactants: "Crude C4 stream", conditions: "Catalyst")
        ],
        chemClass: "Alkenes"
    ).toMolecule()

    static let butadiene = MoleculeDefinition(
        name: "1,3-Butadiene",
        formula: "C₄H₆",
        family: .polymer,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 54.09,
        bondEnergy: 580,
        atoms: [
            A(.C, -2.1, -0.4, 0), A(.C, -0.7, 0.4, 0), 
            A(.C, 0.7, -0.4, 0), A(.C, 2.1, 0.4, 0),
            A(.H, -2.6, -1.2, 0), A(.H, -2.6, 0.5, 0),
            A(.H, -0.4, 1.4, 0), A(.H, 0.4, -1.4, 0),
            A(.H, 2.6, -0.4, 0), A(.H, 2.6, 1.3, 0)
        ],
        bonds: [B(0, 1, 2), B(1, 2), B(2, 3, 2), B(0, 4), B(0, 5), B(1, 6), B(2, 7), B(3, 8), B(3, 9)],
        labMission: "A conjugated system essential for the creation of synthetic rubber and tires.",
        keyTakeaways: ["Synthetic rubber", "Conjugated diene", "Carcinogen"],
        historicContext: HistoricContext(discoverer: "Henry Edward Armstrong", year: 1886, impact: "The backbone of the vivid rubber industry."),
        funFact: "Over 60% of all butadiene produced goes into making tires for vehicles.",
        synthesisRoutes: [
             SynthesisRoute(name: "Dehydrogenation", description: "Removal of hydrogen from butane.", reactants: "C₄H₁₀ → C₄H₆ + 2H₂", conditions: "Catalyst, Heat")
        ],
        chemClass: "Alkenes"
    ).toMolecule()

    static let pentene1 = MoleculeDefinition(
        name: "Pent-1-ene",
        formula: "C₅H₁₀",
        family: .polymer,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 70.13,
        bondEnergy: 595,
        atoms: [
            A(.C, -2.8, 0, 0), A(.C, -1.5, 0.8, 0),
            A(.C, -0.1, 0, 0), A(.C, 1.2, 0.8, 0), A(.C, 2.5, 0, 0),
            A(.H, -3.3, -0.9, 0), A(.H, -3.3, 0.9, 0),
            A(.H, -1.1, 1.8, 0),
            A(.H, -0.1, -1.0, 0), A(.H, -0.1, 0, 1.1),
            A(.H, 1.2, 1.8, 0), A(.H, 1.2, 0.8, 1.1),
            A(.H, 2.5, -1.0, 0), A(.H, 3.0, 0, 0.9), A(.H, 3.0, 0, -0.9)
        ],
        bonds: [B(0, 1, 2), B(1, 2), B(2, 3), B(3, 4), B(0, 5), B(0, 6), B(1, 7), B(2, 8), B(2, 9), B(3, 10), B(3, 11), B(4, 12), B(4, 13), B(4, 14)],
        labMission: "An alpha-olefin used to modify the crystal structure of polyethylene.",
        keyTakeaways: ["Alpha olefin", "Copolymer", "High volatility"],
        historicContext: HistoricContext(discoverer: "Industrial Chemists", year: 1900, impact: "Optimized for polymer blending."),
        funFact: "Used as a blending agent in high-octane gasoline to improve combustion.",
        synthesisRoutes: [
            SynthesisRoute(name: "Thermal Cracking", description: "Cracking of petroleum waxes.", reactants: "Petroleum Wax", conditions: "Heat")
        ],
        chemClass: "Alkenes"
    ).toMolecule()

    static let ethyne = MoleculeDefinition(
        name: "Ethyne (Acetylene)",
        formula: "C₂H₂",
        family: .highEnergy,
        hybridization: .sp,
        bondType: .covalent,
        molarMass: 26.04,
        bondEnergy: 839,
        atoms: [
            A(.C, -0.6, 0, 0), A(.C, 0.6, 0, 0),
            A(.H, -1.7, 0, 0), A(.H, 1.7, 0, 0)
        ],
        bonds: [B(0, 1, 3), B(0, 2), B(1, 3)],
        labMission: "A linear torch burning hot enough to cut through steel.",
        keyTakeaways: ["Welding gas", "Triple bond", "Hottest flame"],
        historicContext: HistoricContext(discoverer: "Edmund Davy", year: 1836, impact: "Enabled modern welding and construction."),
        funFact: "Burns at over 3,300°C when mixed with oxygen, the hottest chemical flame known.",
        synthesisRoutes: [
            SynthesisRoute(name: "Carbide Hydrolysis", description: "Reaction of calcium carbide with water.", reactants: "CaC₂ + 2H₂O → C₂H₂ + Ca(OH)₂", conditions: "Ambient"),
            SynthesisRoute(name: "Partial Combustion", description: "Partial combustion of methane.", reactants: "CH₄ + O₂", conditions: "High Temp")
        ],
        chemClass: "Alkynes"
    ).toMolecule()

    static let propyne = MoleculeDefinition(
        name: "Propyne",
        formula: "C₃H₄",
        family: .highEnergy,
        hybridization: .sp,
        bondType: .covalent,
        molarMass: 40.06,
        bondEnergy: 820,
        atoms: [
            A(.C, -1.2, 0, 0), A(.C, 0, 0, 0), A(.C, 1.4, 0, 0),
            A(.H, 1.4, 1.1, 0), A(.H, 1.4, -0.5, 0.9), A(.H, 1.4, -0.5, -0.9),
            A(.H, -2.2, 0, 0)
        ],
        bonds: [B(0, 1, 3), B(1, 2), B(0, 6), B(2, 3), B(2, 4), B(2, 5)],
        labMission: "A denser cousin of acetylene used for specialized rocket fuels.",
        keyTakeaways: ["Methylacetylene", "Rocket fuel", "Triple bond"],
        historicContext: HistoricContext(discoverer: "Organic Pioneers", year: 1860, impact: "Liquid fuel alternative to acetylene."),
        funFact: "Used in the MAPP gas mixture for welding when portability is required.",
         synthesisRoutes: [
            SynthesisRoute(name: "Thermal Cracking", description: "Byproduct of hydrocarbon cracking.", reactants: "Propane/Butane mix", conditions: "High Temp")
        ]
    ).toMolecule()

    static let but1yne = MoleculeDefinition(
        name: "But-1-yne",
        formula: "C₄H₆",
        family: .highEnergy,
        hybridization: .sp,
        bondType: .covalent,
        molarMass: 54.09,
        bondEnergy: 830,
        atoms: [
            A(.C, -1.8, 0, 0), A(.C, -0.6, 0, 0),
            A(.C, 0.8, 0.5, 0), A(.C, 2.0, -0.2, 0),
            A(.H, -2.8, 0, 0),
            A(.H, 0.8, 1.6, 0), A(.H, 0.8, 0.5, 1.1),
            A(.H, 2.0, -1.3, 0), A(.H, 2.8, 0.3, 0.9), A(.H, 2.8, 0.3, -0.9)
        ],
        bonds: [B(0, 1, 3), B(1, 2), B(2, 3), B(0, 4), B(2, 5), B(2, 6), B(3, 7), B(3, 8), B(3, 9)],
        labMission: "A reactive gas used in the synthesis of organic compounds.",
        keyTakeaways: ["Ethylacetylene", "Reactive", "Flammable"],
        historicContext: HistoricContext(discoverer: "Unknown", year: 1870, impact: "Building block for synthetic rubber."),
        funFact: "It burns with a smoky flame due to its high carbon content.",
        synthesisRoutes: [
             SynthesisRoute(name: "Dehydrohalogenation", description: "Elimination of hydrogen halides from dihalides.", reactants: "Dihalobutane", conditions: "Strong Base")
        ],
        chemClass: "Alkynes"
    ).toMolecule()

    static let but2yne = MoleculeDefinition(
        name: "But-2-yne",
        formula: "C₄H₆",
        family: .highEnergy,
        hybridization: .sp,
        bondType: .covalent,
        molarMass: 54.09,
        bondEnergy: 840,
        atoms: [
            A(.C, -0.6, 0, 0), A(.C, 0.6, 0, 0),
            A(.C, -2.0, 0, 0), A(.C, 2.0, 0, 0),
            A(.H, -2.5, 0.9, 0), A(.H, -2.5, -0.5, 0.9), A(.H, -2.5, -0.5, -0.9),
            A(.H, 2.5, 0.9, 0), A(.H, 2.5, -0.5, 0.9), A(.H, 2.5, -0.5, -0.9)
        ],
        bonds: [B(0, 1, 3), B(0, 2), B(1, 3), B(2, 4), B(2, 5), B(2, 6), B(3, 7), B(3, 8), B(3, 9)],
        labMission: "Dimethylacetylene. A symmetric alkyne with a higher boiling point than its isomer.",
        keyTakeaways: ["Symmetric alkyne", "Internal alkyne", "Higher BP"],
        historicContext: HistoricContext(discoverer: "Wislicenus", year: 1890, impact: "Studied for geometric isomerism absence."),
        funFact: "Because the triple bond is in the middle, it has no acidic protons like terminal alkynes.",
        synthesisRoutes: [
            SynthesisRoute(name: "Isomerization", description: "Isomerization of 1-butyne.", reactants: "1-Butyne", conditions: "Base Catalyst")
        ]
    ).toMolecule()

    static let pentyne = MoleculeDefinition(
        name: "Pent-1-yne",
        formula: "C₅H₈",
        family: .highEnergy,
        hybridization: .sp,
        bondType: .covalent,
        molarMass: 68.12,
        bondEnergy: 835,
        atoms: [
            A(.C, -2.4, 0, 0), A(.C, -1.2, 0, 0),
            A(.C, 0.2, 0.5, 0), A(.C, 1.4, -0.2, 0), A(.C, 2.6, 0.5, 0),
            A(.H, -3.4, 0, 0),
            A(.H, 0.2, 1.6, 0), A(.H, 0.2, 0.5, 1.1),
            A(.H, 1.4, -1.3, 0), A(.H, 1.4, -0.2, 1.1),
            A(.H, 3.6, 0, 0), A(.H, 2.6, 1.6, 0), A(.H, 2.6, 0.5, 1.1)
        ],
        bonds: [B(0, 1, 3), B(1, 2), B(2, 3), B(3, 4), B(0, 5), B(2, 6), B(2, 7), B(3, 8), B(3, 9), B(4, 10), B(4, 11), B(4, 12)],
        labMission: "A clear liquid alkyne used as a building block for specialty chemicals.",
        keyTakeaways: ["Terminal alkyne", "Propylacetylene", "Intermediate"],
        historicContext: HistoricContext(discoverer: "Unknown", year: 1900, impact: "Used in organic synthesis."),
        funFact: "Like other terminal alkynes, it can form explosive salts with silver or copper.",
        synthesisRoutes: [
            SynthesisRoute(name: "Alkylation", description: "Reaction of sodium acetylide with propyl bromide.", reactants: "NaC≡CH + C₃H₇Br", conditions: "Liquid Ammonia")
        ],
        chemClass: "Alkynes"
    ).toMolecule()

    static let formaldehyde = MoleculeDefinition(
        name: "Formaldehyde",
        formula: "CH₂O",
        family: .highEnergy,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 30.03,
        bondEnergy: 1080,
        atoms: [
            A(.C, 0, 0, 0),
            A(.O, 1.2, 0, 0),
            A(.H, -0.6, 0.9, 0), A(.H, -0.6, -0.9, 0)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(0, 3)],
        labMission: "The simplest aldehyde, freezing biology in time as a preservative.",
        keyTakeaways: ["Preservative", "Carcinogen", "Industrial resin"],
        historicContext: HistoricContext(discoverer: "Alexander Butlerov", year: 1859, impact: "Standard biological fixative."),
        funFact: "Found in interstellar space, proving organic chemistry happens in the void.",
        synthesisRoutes: [
            SynthesisRoute(name: "Methanol Oxidation", description: "Catalytic oxidation of methanol.", reactants: "2CH₃OH + O₂ → 2CH₂O + 2H₂O", conditions: "Ag Catalyst, 650°C")
        ],
        chemClass: "Aldehydes"
    ).toMolecule()

    static let acetaldehyde = MoleculeDefinition(
        name: "Acetaldehyde",
        formula: "C₂H₄O",
        family: .highEnergy,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 44.05,
        bondEnergy: 1070,
        atoms: [
            A(.C, 0, 0, 0), 
            A(.O, 1.2, 0.5, 0),
            A(.H, 0.5, -1.0, 0), 
            A(.C, -1.5, 0, 0), 
            A(.H, -1.8, 1.0, 0), A(.H, -2.0, -0.5, 0.9), A(.H, -2.0, -0.5, -0.9)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(0, 3), B(3, 4), B(3, 5), B(3, 6)],
        labMission: "The hangover molecule. A toxic byproduct of ethanol metabolism.",
        keyTakeaways: ["Hangover cause", "Fruit ripener", "Carcinogen"],
        historicContext: HistoricContext(discoverer: "Carl Wilhelm Scheele", year: 1774, impact: "Identified as 'dephlogisticated' vinegar spirit."),
        funFact: "Responsible for the 'green apple' smell in young wines and beers.",
        synthesisRoutes: [
            SynthesisRoute(name: "Wacker Process", description: "Oxidation of ethylene.", reactants: "2C₂H₄ + O₂ → 2CH₃CHO", conditions: "PdCl₂/CuCl₂ Catalyst")
        ],
        chemClass: "Aldehydes"
    ).toMolecule()

    static let propionaldehyde = MoleculeDefinition(
        name: "Propionaldehyde",
        formula: "C₃H₆O",
        family: .highEnergy,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 58.08,
        bondEnergy: 1060,
        atoms: [
            A(.C, 0, 0, 0), 
            A(.O, 0.6, 1.1, 0),
            A(.H, 0.6, -0.9, 0),
            A(.C, -1.4, -0.2, 0), 
            A(.C, -2.4, 1.0, 0), 
            A(.H, -1.6, -0.8, 0.9), A(.H, -1.6, -0.8, -0.9),
            A(.H, -2.2, 1.6, 0.9), A(.H, -2.2, 1.6, -0.9), A(.H, -3.4, 0.8, 0)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(0, 3), B(3, 4), B(3, 5), B(3, 6), B(4, 7), B(4, 8), B(4, 9)],
        labMission: "A three-carbon aldehyde used in the manufacture of plastics and rubber chemicals.",
        keyTakeaways: ["Plastic precursor", "Suffocating odor", "Reactive"],
        historicContext: HistoricContext(discoverer: "Unknown", year: 1850, impact: "Intermediate in chemical synthesis."),
        funFact: "It has a suffocating, fruity odor and is highly flammable.",
        synthesisRoutes: [
            SynthesisRoute(name: "Hydroformylation", description: "Standard industrial route from ethylene.", reactants: "C₂H₄ + CO + H₂", conditions: "Rh/Co Catalyst")
        ],
        chemClass: "Aldehydes"
    ).toMolecule()

    static let benzaldehyde = MoleculeDefinition(
        name: "Benzaldehyde",
        formula: "C₇H₆O",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 106.12,
        bondEnergy: 1100,
        atoms: [
            A(.C, 0, 0, 0), A(.C, 1.4, 0, 0), A(.C, 2.1, 1.2, 0), 
            A(.C, 1.4, 2.4, 0), A(.C, 0, 2.4, 0), A(.C, -0.7, 1.2, 0),
            A(.C, 3.5, 1.2, 0), 
            A(.O, 4.2, 2.2, 0),
            A(.H, 4.0, 0.2, 0),

            A(.H, -0.5, -0.9, 0), A(.H, 1.9, -0.9, 0), A(.H, 1.9, 3.3, 0), A(.H, -0.5, 3.3, 0), A(.H, -1.7, 1.2, 0)
        ],
        bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0),
            B(2, 6), B(6, 7, 2), B(6, 8),
            B(0, 9), B(1, 10), B(3, 11), B(4, 12), B(5, 13)
        ],
        labMission: "The essence of almonds. A simple aromatic aldehyde used in flavorings and perfumes.",
        keyTakeaways: ["Almond scent", "Maraschino cherries", "Amydalin breakdown"],
        historicContext: HistoricContext(discoverer: "Pierre Robiquet", year: 1832, impact: "Extracted from bitter almonds."),
        funFact: "It gives the characteristic smell to cyanogenic glycosides like those in apple seeds.",
        synthesisRoutes: [
            SynthesisRoute(name: "Toluene Oxidation", description: "Controlled oxidation of toluene.", reactants: "C₇H₈ + O₂", conditions: "V₂O₅ Catalyst")
        ],
        chemClass: "Aldehydes"
    ).toMolecule()

    static let cinnamaldehyde = MoleculeDefinition(
        name: "Cinnamaldehyde",
        formula: "C₉H₈O",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 132.16,
        bondEnergy: 1150,
        atoms: [
            A(.C, 0, 0, 0), A(.C, 1.4, 0, 0), A(.C, 2.1, 1.2, 0),
            A(.C, 1.4, 2.4, 0), A(.C, 0, 2.4, 0), A(.C, -0.7, 1.2, 0),
            A(.C, 3.5, 1.2, 0), 
            A(.C, 4.6, 0.5, 0), 
            A(.C, 6.0, 0.5, 0), 
            A(.O, 6.7, 1.5, 0),
            A(.H, 6.5, -0.5, 0),

            A(.H, 3.8, 2.2, 0), A(.H, 4.3, -0.5, 0),
            A(.H, -1.7, 1.2, 0), A(.H, -0.5, 3.3, 0), A(.H, 1.9, 3.3, 0), A(.H, 1.9, -0.9, 0), A(.H, -0.5, -0.9, 0)
        ],
        bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0),
            B(2, 6), B(6, 7, 2),
            B(7, 8), B(8, 9, 2), B(8, 10),
            B(6, 11), B(7, 12),
            B(5, 13), B(4, 14), B(3, 15), B(1, 16), B(0, 17)
        ],
        labMission: "The warm spice of winter. An aromatic shield against bacteria and fungi.",
        keyTakeaways: ["Cinnamon flavor", "Antimicrobial", "Corrosion inhibitor"],
        historicContext: HistoricContext(discoverer: "Jean-Baptiste Dumas", year: 1834, impact: "Isolated from cinnamon bark oil."),
        funFact: "Used as a natural pesticide; mosquito larvae die quickly when exposed to it.",
        synthesisRoutes: [
            SynthesisRoute(name: "Aldol Condensation", description: "Condensation of benzaldehyde and acetaldehyde.", reactants: "C₆H₅CHO + CH₃CHO", conditions: "Base Catalyst")
        ],
        chemClass: "Aldehydes"
    ).toMolecule()

    static let acetone = MoleculeDefinition(
        name: "Acetone",
        formula: "C₃H₆O",
        family: .highEnergy,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 58.08,
        bondEnergy: 1060,
        atoms: [
            A(.C, 0, 0, 0), 
            A(.O, 0, 1.2, 0),
            A(.C, -1.3, -0.7, 0), 
            A(.C, 1.3, -0.7, 0), 
            A(.H, -1.3, -1.8, 0), A(.H, -1.8, -0.4, 0.9), A(.H, -1.8, -0.4, -0.9),
            A(.H, 1.3, -1.8, 0), A(.H, 1.8, -0.4, 0.9), A(.H, 1.8, -0.4, -0.9)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(0, 3), 
                B(2, 4), B(2, 5), B(2, 6), 
                B(3, 7), B(3, 8), B(3, 9)],
        labMission: "The universal solvent for paints and plastics. Highly volatile and flammable.",
        keyTakeaways: ["Nail polish remover", "Solvent", "Produced in ketoacidosis"],
        historicContext: HistoricContext(discoverer: "Andreas Libavius", year: 1606, impact: "First produced by distilling lead acetate."),
        funFact: "Your body produces acetone when burning fat for energy, which can make your breath smell fruit-like.",
        synthesisRoutes: [
            SynthesisRoute(name: "Cumene Process", description: "Co-produced with phenol from cumene.", reactants: "Cumene + O₂", conditions: "Acid Cleavage")
        ],
        chemClass: "Ketones"
    ).toMolecule()

    static let butanone = MoleculeDefinition(
        name: "Butanone (MEK)",
        formula: "C₄H₈O",
        family: .highEnergy,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 72.11,
        bondEnergy: 1080,
        atoms: [
            A(.C, 0, 0, 0), 
            A(.O, 0, 1.2, 0),
            A(.C, -1.3, -0.7, 0), 
            A(.C, 1.3, -0.7, 0), 
            A(.C, 2.6, -1.4, 0), 

            A(.H, -1.8, -0.7, 0), A(.H, -1.3, -1.7, 0.9), A(.H, -1.3, -1.7, -0.9),
            A(.H, 1.3, 0, 1.0), A(.H, 1.3, 0, -1.0),
            A(.H, 2.6, -2.4, 0), A(.H, 3.1, -1.0, 0.9), A(.H, 3.1, -1.0, -0.9)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(0, 3), B(3, 4), 
                B(2, 5), B(2, 6), B(2, 7),
                B(3, 8), B(3, 9),
                B(4, 10), B(4, 11), B(4, 12)],
        labMission: "Methyl Ethyl Ketone. A stronger, harsher cousin of acetone used in industrial welding of plastics.",
        keyTakeaways: ["Industrial solvent", "Plastic welding", "Sharp odor"],
        historicContext: HistoricContext(discoverer: "Unknown Industrialists", year: 1850, impact: "Key solvent for gums, resins, and cellulose."),
        funFact: "It dissolves polystyrene so effectively it 'welds' plastic parts together.",
        synthesisRoutes: [
            SynthesisRoute(name: "Dehydrogenation", description: "Dehydrogenation of 2-butanol.", reactants: "C₄H₉OH → C₄H₈O + H₂", conditions: "Cu/Zn Catalyst")
        ]
    ).toMolecule()

    static let cyclohexanone = MoleculeDefinition(
        name: "Cyclohexanone",
        formula: "C₆H₁₀O",
        family: .cyclicHydrocarbon,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 98.15,
        bondEnergy: 1100,
        atoms: [
            A(.C, 0.00, 1.40, 0.00),
            A(.O, 0.00, 2.60, 0.00),
            A(.C, 1.20, 0.70, 0.50),
            A(.C, 1.20, -0.70, -0.50),
            A(.C, 0.00, -1.40, 0.00),
            A(.C, -1.20, -0.70, 0.50),
            A(.C, -1.20, 0.70, -0.50),
            A(.H, 2.10, 1.30, 0.36),
            A(.H, 1.11, 0.44, 1.56),
            A(.H, 1.11, -0.44, -1.56),
            A(.H, 2.10, -1.30, -0.36),
            A(.H, 0.35, -2.01, 0.83),
            A(.H, -0.35, -2.01, -0.83),
            A(.H, -2.10, -1.30, 0.36),
            A(.H, -1.11, -0.44, 1.56),
            A(.H, -1.11, 0.44, -1.56),
            A(.H, -2.10, 1.30, -0.36)
        ],
        bonds: [
            B(0, 1, 2), B(0, 2), B(2, 3), B(3, 4), B(4, 5), B(5, 6), B(6, 0), B(2, 7), 
            B(2, 8), B(3, 9), B(3, 10), B(4, 11), B(4, 12), B(5, 13), B(5, 14), B(6, 15), 
            B(6, 16)
        ],
        labMission: "A cyclic ketone that serves as the gateway to Nylon synthesis.",
        keyTakeaways: ["Nylon precursor", "Cyclic ketone", "Peppermint-like odor"],
        historicContext: HistoricContext(discoverer: "Inventors of Nylon", year: 1935, impact: "Raw material for Nylon 6,6."),
        funFact: "Billions of kilograms are produced annually just to satisfy the world's demand for nylon.",
        synthesisRoutes: [
             SynthesisRoute(name: "Cyclohexane Oxidation", description: "Catalytic oxidation of cyclohexane.", reactants: "C₆H₁₂ + O₂", conditions: "Co Catalyst")
        ]
    ).toMolecule()

    static let acetophenone = MoleculeDefinition(
        name: "Acetophenone",
        formula: "C₈H₈O",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 120.15,
        bondEnergy: 1120,
        atoms: [

            A(.C, 0, 0, 0), A(.C, 1.4, 0, 0), A(.C, 2.1, 1.2, 0),
            A(.C, 1.4, 2.4, 0), A(.C, 0, 2.4, 0), A(.C, -0.7, 1.2, 0),

            A(.C, 3.5, 1.2, 0), 
            A(.O, 4.2, 2.2, 0), 
            A(.C, 4.2, -0.1, 0), 

            A(.H, 3.8, -0.9, 0), A(.H, 4.7, -0.1, 0.9), A(.H, 4.7, -0.1, -0.9),
            A(.H, -0.5, -0.9, 0), A(.H, 1.9, -0.9, 0), A(.H, 1.9, 3.3, 0), A(.H, -0.5, 3.3, 0), A(.H, -1.7, 1.2, 0)
        ],
        bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0),
            B(2, 6), B(6, 7, 2), B(6, 8),
            B(8, 9), B(8, 10), B(8, 11),
            B(0, 12), B(1, 13), B(3, 14), B(4, 15), B(5, 16)
        ],
        labMission: "The simplest aromatic ketone. A precursor to resins and fragrances.",
        keyTakeaways: ["Orange blossom scent", "Hypnotic", "Resin precursor"],
        historicContext: HistoricContext(discoverer: "Friedel & Crafts", year: 1877, impact: "Classic example of Friedel-Crafts acylation."),
        funFact: "Used as a sleeping aid in the late 19th century under the name Hypnone.",
        synthesisRoutes: [
            SynthesisRoute(name: "Friedel-Crafts Acylation", description: "Acylation of benzene.", reactants: "Benzene + Acetyl Chloride", conditions: "AlCl₃ Catalyst")
        ],
        chemClass: "Ketones"
    ).toMolecule()

    static let pentan2one = MoleculeDefinition(
        name: "Pentan-2-one",
        formula: "C₅H₁₀O",
        family: .highEnergy,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 86.13,
        bondEnergy: 1090,
        atoms: [
            A(.C, 0, 0, 0), 
            A(.O, 0, 1.2, 0),
            A(.C, -1.3, -0.7, 0), 
            A(.C, 1.3, -0.7, 0), 
            A(.C, 2.6, 0, 0), 
            A(.C, 3.9, -0.7, 0), 

            A(.H, -1.3, -1.8, 0), A(.H, -1.8, -0.4, 0.9), A(.H, -1.8, -0.4, -0.9),
            A(.H, 1.3, -1.8, 0), A(.H, 1.8, -0.4, 0.9),
            A(.H, 2.6, 1.1, 0), A(.H, 2.1, 0, -0.9),
            A(.H, 3.9, -1.8, 0), A(.H, 4.4, -0.4, 0.9), A(.H, 4.4, -0.4, -0.9)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(0, 3), B(3, 4), B(4, 5),
                B(2, 6), B(2, 7), B(2, 8),
                B(3, 9), B(3, 10),
                B(4, 11), B(4, 12),
                B(5, 13), B(5, 14), B(5, 15)],
        labMission: "A medium-chain ketone used as a solvent and flavoring agent.",
        keyTakeaways: ["Solvent", "Fruit flavor", "Metabolic byproduct"],
        historicContext: HistoricContext(discoverer: "Standard Lab", year: 1900, impact: "Comparative standard for ketone reactivity."),
        funFact: "Comparable to acetone but with a slower evaporation rate, useful in specialized paints.",
        synthesisRoutes: [
            SynthesisRoute(name: "2-Pentanol Oxidation", description: "Oxidation of secondary alcohol.", reactants: "C₅H₁₁OH + [O]", conditions: "Oxidizing Agent")
        ],
        chemClass: "Ketones"
    ).toMolecule()

    static let formicAcid = MoleculeDefinition(
        name: "Formic Acid",
        formula: "CH₂O₂",
        family: .biomolecule,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 46.03,
        bondEnergy: 1120,
        atoms: [
            A(.C, 0, 0, 0),
            A(.O, 0, 1.2, 0), 
            A(.O, 1.1, -0.6, 0), 
            A(.H, 1.8, -0.2, 0), 
            A(.H, -0.9, -0.5, 0) 
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4)],
        labMission: "Chemical warfare agent of the ant colony. The simplest acid used for defense.",
        keyTakeaways: ["Ant venom", "Simplest carboxylic acid", "Bee sting"],
        historicContext: HistoricContext(discoverer: "John Ray", year: 1671, impact: "Distilled from crushed red ants."),
        funFact: "The name comes from 'formica', Latin for ant.",
        synthesisRoutes: [
            SynthesisRoute(name: "Methyl Formate Hydrolysis", description: "Two-stage process from methanol and CO.", reactants: "CH₃OH + CO → HCOOCH₃ → HCOOH", conditions: "Base Catalyst")
        ],
        chemClass: "Carboxylic Acids"
    ).toMolecule()

    static let aceticAcid = MoleculeDefinition(
        name: "Acetic Acid",
        formula: "CH₃COOH",
        family: .biomolecule,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 60.05,
        bondEnergy: 1130,
        atoms: [
            A(.C, 0, 0, 0), 
            A(.O, 0, 1.2, 0),
            A(.O, 1.1, -0.6, 0),
            A(.H, 1.8, -0.2, 0),
            A(.C, -1.4, -0.5, 0), 
            A(.H, -1.4, -1.6, 0), A(.H, -1.9, -0.2, 0.9), A(.H, -1.9, -0.2, -0.9)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4), B(4, 5), B(4, 6), B(4, 7)],
        labMission: "Vinegar's biting soul. A metabolic intermediate and bacterial fermentation product.",
        keyTakeaways: ["Vinegar", "Weak acid", "Acetyl group source"],
        historicContext: HistoricContext(discoverer: "Jabir ibn Hayyan", year: 700, impact: "Concentrated by distillation."),
        funFact: "Glacial acetic acid freezes at 16.6°C, forming ice-like crystals in a slightly cool room.",
        synthesisRoutes: [
            SynthesisRoute(name: "Cativa Process", description: "Carbonylation of methanol.", reactants: "CH₃OH + CO", conditions: "Ir Catalyst")
        ]
    ).toMolecule()

    static let propionicAcid = MoleculeDefinition(
        name: "Propionic Acid",
        formula: "C₃H₆O₂",
        family: .biomolecule,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 74.08,
        bondEnergy: 1140,
        atoms: [
            A(.C, 0, 0, 0), 
            A(.O, 0, 1.2, 0),
            A(.O, 1.1, -0.6, 0), A(.H, 1.8, -0.2, 0),
            A(.C, -1.4, -0.5, 0), 
            A(.C, -2.7, 0.2, 0), 
            A(.H, -1.4, -1.6, 0), A(.H, -1.4, -0.5, 1.0),
            A(.H, -2.7, 1.3, 0), A(.H, -3.2, 0, 0.9), A(.H, -3.2, 0, -0.9)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4), B(4, 5),
                B(4, 6), B(4, 7), B(5, 8), B(5, 9), B(5, 10)],
        labMission: "Responsible for the distinct smell of Swiss cheese and sweat.",
        keyTakeaways: ["Cheese preservative", "Body odor", "Antifungal"],
        historicContext: HistoricContext(discoverer: "Johann Gottlieb", year: 1844, impact: "Isolated from sugar degradation products."),
        funFact: "Bacteria on your skin produce this acid, which is why foot odor smells like cheese.",
        synthesisRoutes: [
            SynthesisRoute(name: "Hydrocarboxylation", description: "Reaction of ethylene with CO and steam.", reactants: "C₂H₄ + CO + H₂O", conditions: "Ni(CO)₄ Catalyst")
        ]
    ).toMolecule()

    static let butyricAcid = MoleculeDefinition(
        name: "Butyric Acid",
        formula: "C₄H₈O₂",
        family: .biomolecule,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 88.11,
        bondEnergy: 1150,
        atoms: [
            A(.C, 0, 0, 0), 
            A(.O, 0, 1.2, 0), A(.O, 1.1, -0.6, 0), A(.H, 1.8, -0.2, 0),
            A(.C, -1.4, -0.5, 0), 
            A(.C, -2.7, 0.2, 0), 
            A(.C, -4.0, -0.3, 0), 
            A(.H, -1.4, -1.6, 0), A(.H, -1.4, -0.5, 1.0),
            A(.H, -2.7, 1.3, 0), A(.H, -2.7, 0.2, 1.0),
            A(.H, -4.0, -1.4, 0), A(.H, -4.5, 0, 0.9), A(.H, -4.5, 0, -0.9)
        ],
        bonds: [B(0, 1, 2), B(0, 2), B(2, 3), B(0, 4), B(4, 5), B(5, 6),
                B(4, 7), B(4, 8), B(5, 9), B(5, 10), B(6, 11), B(6, 12), B(6, 13)],
        labMission: "The stench of rancid butter and vomit. A powerful signal of decay.",
        keyTakeaways: ["Rancid butter", "Vomit smell", "Gut health"],
        historicContext: HistoricContext(discoverer: "Michel Chevreul", year: 1814, impact: "Discovered in butter (butyrum)."),
        funFact: "Despite its terrible smell, it is a vital nutrient for the cells lining your colon.",
        synthesisRoutes: [
            SynthesisRoute(name: "Oxidation", description: "Oxidation of butyraldehyde.", reactants: "C₄H₈O + O₂", conditions: "Catalyst")
        ]
    ).toMolecule()

    static let citricAcid = MoleculeDefinition(
        name: "Citric Acid (Simp)",
        formula: "C₆H₈O₇",
        family: .biomolecule,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 192.12,
        bondEnergy: 2200,
        atoms: [
            A(.C, 0.00, 0.00, 0.00),
            A(.C, 1.40, 0.00, 0.00),
            A(.C, -1.40, 0.00, 0.00),
            A(.O, 0.00, 1.40, 0.00),
            A(.H, 0.00, 2.00, 0.00),
            A(.C, 0.00, -1.40, 0.00),
            A(.O, 0.60, -2.00, 0.00),
            A(.O, -0.60, -2.00, 0.00),
            A(.H, 0.80, -2.40, 0.00),
            A(.C, 2.40, 0.80, 0.00),
            A(.O, 2.40, 2.00, 0.00),
            A(.O, 3.40, 0.40, 0.00),
            A(.H, 4.00, 0.60, 0.00),
            A(.C, -2.40, 0.80, 0.00),
            A(.O, -2.40, 2.00, 0.00),
            A(.O, -3.40, 0.40, 0.00),
            A(.H, -4.00, 0.60, 0.00),
            A(.H, 1.59, -0.53, 0.93),
            A(.H, 1.59, -0.53, -0.93),
            A(.H, -1.59, -0.53, 0.93),
            A(.H, -1.59, -0.53, -0.93)
        ],
        bonds: [
            B(0, 1), B(0, 2), B(0, 3), B(3, 4), B(0, 5), B(5, 6, 2), B(5, 7), B(7, 8), 
            B(1, 9), B(9, 10, 2), B(9, 11), B(11, 12), B(2, 13), B(13, 14, 2), B(13, 15), B(15, 16), 
            B(1, 17), B(1, 18), B(2, 19), B(2, 20)
        ],
        labMission: "The sour power of lemons. A key player in the Krebs cycle for cellular energy.",
        keyTakeaways: ["Citrus sourness", "Krebs cycle", "Preservative"],
        historicContext: HistoricContext(discoverer: "Carl Wilhelm Scheele", year: 1784, impact: "Crystallized from lemon juice."),
        funFact: "It serves as an environmentally benign cleaning agent and water softener.",
        synthesisRoutes: [
            SynthesisRoute(name: "Fermentation", description: "Fermentation of molasses by Aspergillus niger.", reactants: "Sugar + Mold", conditions: "Aerobic")
        ]
    ).toMolecule()

    static let benzene = MoleculeDefinition(
        name: "Benzene",
        formula: "C₆H₆",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 78.11,
        bondEnergy: 518,
        atoms: [
            A(.C, 1.4, 0, 0), A(.C, 0.7, 1.21, 0), A(.C, -0.7, 1.21, 0),
            A(.C, -1.4, 0, 0), A(.C, -0.7, -1.21, 0), A(.C, 0.7, -1.21, 0),
            A(.H, 2.49, 0, 0), A(.H, 1.24, 2.15, 0), A(.H, -1.24, 2.15, 0),
            A(.H, -2.49, 0, 0), A(.H, -1.24, -2.15, 0), A(.H, 1.24, -2.15, 0)
        ],
        bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0),
            B(0, 6), B(1, 7), B(2, 8), B(3, 9), B(4, 10), B(5, 11)
        ],
        labMission: "The Ouroboros ring. A perfect hexagon of resonance that defies simple bond theory.",
        keyTakeaways: ["Aromaticity", "Carcinogen", "Petrochemical base"],
        historicContext: HistoricContext(discoverer: "Michael Faraday", year: 1825, impact: "Defined the concept of aromaticity."),
        funFact: "Kekulé claimed he discovered the ring shape after dreaming of a snake eating its own tail.",
        synthesisRoutes: [
            SynthesisRoute(name: "Catalytic Reforming", description: "Reforming of naphtha fractions.", reactants: "Naphtha", conditions: "Pt/Re Catalyst")
        ],
        chemClass: "Aromatics"
    ).toMolecule()

    static let toluene = MoleculeDefinition(
        name: "Toluene",
        formula: "C₇H₈",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 92.14,
        bondEnergy: 520,
        atoms: [
            A(.C, 0, 0, 0), A(.C, 1.4, 0, 0), A(.C, 2.1, 1.2, 0),
            A(.C, 1.4, 2.4, 0), A(.C, 0, 2.4, 0), A(.C, -0.7, 1.2, 0), 
            A(.C, 3.6, 1.2, 0), 

            A(.H, -0.5, -0.9, 0), A(.H, 1.9, -0.9, 0),
            A(.H, 1.9, 3.3, 0), A(.H, -0.5, 3.3, 0), A(.H, -1.8, 1.2, 0),

            A(.H, 3.9, 2.22, 0), A(.H, 4.0, 0.69, 0.88), A(.H, 4.0, 0.69, -0.88)
        ],
        bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0),
            B(2, 6),
            B(0, 7), B(1, 8), B(3, 9), B(4, 10), B(5, 11),
            B(6, 12), B(6, 13), B(6, 14)
        ],
        labMission: "The aromatic solvent of choice. A benzene ring made safe(r) by a methyl handle.",
        keyTakeaways: ["Solvent", "TNT precursor", "Octane booster"],
        historicContext: HistoricContext(discoverer: "Pierre-Joseph Pelletier", year: 1837, impact: "Isolated from pine oil."),
        funFact: "It smells like paint thinner because it IS paint thinner (often).",
        synthesisRoutes: [
            SynthesisRoute(name: "Catalytic Reforming", description: "Reforming of C7 fraction.", reactants: "Methylcyclohexane", conditions: " dehydrogenation")
        ],
        chemClass: "Aromatics"
    ).toMolecule()

    static let naphthalene = MoleculeDefinition(
        name: "Naphthalene",
        formula: "C₁₀H₈",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 128.17,
        bondEnergy: 530,
        atoms: [
            A(.C, -0.70, 0.70, 0.00),
            A(.C, 0.70, 0.70, 0.00),
            A(.C, -1.40, 1.90, 0.00),
            A(.C, -0.70, 3.10, 0.00),
            A(.C, 0.70, 3.10, 0.00),
            A(.C, 1.40, 1.90, 0.00),
            A(.C, -1.40, -0.50, 0.00),
            A(.C, -0.70, -1.70, 0.00),
            A(.C, 0.70, -1.70, 0.00),
            A(.C, 1.40, -0.50, 0.00),
            A(.H, -2.50, 1.90, 0.00),
            A(.H, -1.20, 4.00, 0.00),
            A(.H, 1.20, 4.00, 0.00),
            A(.H, 2.50, 1.90, 0.00),
            A(.H, -2.50, -0.50, 0.00),
            A(.H, -1.20, -2.60, 0.00),
            A(.H, 1.20, -2.60, 0.00),
            A(.H, 2.50, -0.50, 0.00)
        ],
        bonds: [
            B(0, 1), B(0, 2, 2), B(2, 3), B(3, 4, 2), B(4, 5), B(5, 1, 2),
            B(0, 6), B(6, 7, 2), B(7, 8), B(8, 9, 2), B(9, 1),
            B(2, 10), B(3, 11), B(4, 12), B(5, 13), B(6, 14), B(7, 15), B(8, 16), B(9, 17)
        ],
        labMission: "Mothballs and starlight. The simplest polycyclic aromatic hydrocarbon (PAH).",
        keyTakeaways: ["Mothballs", "Sublimation", "PAH"],
        historicContext: HistoricContext(discoverer: "Garden", year: 1819, impact: "Derived from coal tar."),
        funFact: "Naphthalene crystals sublime, turning directly from solid to distinctive-smelling gas.",
        synthesisRoutes: [
            SynthesisRoute(name: "Coal Tar Distillation", description: "Historically isolated from coal tar.", reactants: "Coal Tar", conditions: "Distillation")
        ],
        chemClass: "Aromatics"
    ).toMolecule()

    static let anthracene = MoleculeDefinition(
        name: "Anthracene",
        formula: "C₁₄H₁₀",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 178.23,
        bondEnergy: 540,
        atoms: [

            A(.C, -1.2, 0.7, 0), A(.C, 0, 1.4, 0), A(.C, 1.2, 0.7, 0),
            A(.C, 1.2, -0.7, 0), A(.C, 0, -1.4, 0), A(.C, -1.2, -0.7, 0), 

            A(.C, -2.4, 1.4, 0), A(.C, -3.6, 0.7, 0), A(.C, -3.6, -0.7, 0), A(.C, -2.4, -1.4, 0), 

            A(.C, 2.4, 1.4, 0), A(.C, 3.6, 0.7, 0), A(.C, 3.6, -0.7, 0), A(.C, 2.4, -1.4, 0), 

            A(.H, 0, 2.5, 0), A(.H, 0, -2.5, 0), 
            A(.H, -2.4, 2.5, 0), A(.H, -4.7, 1.2, 0), A(.H, -4.7, -1.2, 0), A(.H, -2.4, -2.5, 0),
            A(.H, 2.4, 2.5, 0), A(.H, 4.7, 1.2, 0), A(.H, 4.7, -1.2, 0), A(.H, 2.4, -2.5, 0)
        ],
        bonds: [

            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0),

            B(0, 6), B(6, 7, 2), B(7, 8), B(8, 9, 2), B(9, 5),

            B(2, 10), B(10, 11, 2), B(11, 12), B(12, 13, 2), B(13, 3),

            B(1, 14), B(4, 15),
            B(6, 16), B(7, 17), B(8, 18), B(9, 19),
            B(10, 20), B(11, 21), B(12, 22), B(13, 23)
        ],
        labMission: "A red-fluorescing triple ring wood preservative found in coal tar.",
        keyTakeaways: ["Blue fluorescence", "Scintillator", "Red dye AI"],
        historicContext: HistoricContext(discoverer: "Dumas & Laurent", year: 1832, impact: "Used to produce the red dye alizarin."),
        funFact: "Anthracene crystals are used in high-energy physics detectors to track particles.",
        synthesisRoutes: [
            SynthesisRoute(name: "Coal Tar Distillation", description: "Isolated from anthracene oil fraction.", reactants: "Coal Tar", conditions: "Crystallization")
        ],
        chemClass: "Aromatics"
    ).toMolecule()

    static let xylene = MoleculeDefinition(
        name: "p-Xylene",
        formula: "C₈H₁₀",
        family: .aromatic,
        hybridization: .sp2,
        bondType: .covalent,
        molarMass: 106.16,
        bondEnergy: 510,
        atoms: [
            A(.C, 0.00, 1.40, 0.00),
            A(.C, 1.20, 0.70, 0.00),
            A(.C, 1.20, -0.70, 0.00),
            A(.C, 0.00, -1.40, 0.00),
            A(.C, -1.20, -0.70, 0.00),
            A(.C, -1.20, 0.70, 0.00),
            A(.C, 0.00, 2.90, 0.00),
            A(.C, 0.00, -2.90, 0.00),
            A(.H, 2.10, 1.20, 0.00),
            A(.H, 2.10, -1.20, 0.00),
            A(.H, -2.10, -1.20, 0.00),
            A(.H, -2.10, 1.20, 0.00),
            A(.H, 0.00, 3.30, 1.00),
            A(.H, -0.90, 3.30, -0.50),
            A(.H, 0.90, 3.30, -0.50),
            A(.H, 0.77, -3.26, -0.68),
            A(.H, 0.20, -3.26, 1.01),
            A(.H, -0.97, -3.26, -0.33)
        ],
        bonds: [
            B(0, 1, 2), B(1, 2), B(2, 3, 2), B(3, 4), B(4, 5, 2), B(5, 0), B(0, 6), B(3, 7), 
            B(1, 8), B(2, 9), B(4, 10), B(5, 11), B(6, 12), B(6, 13), B(6, 14), B(7, 15), 
            B(7, 16), B(7, 17)
        ],
        labMission: "Para-xylene. The 'P' in PET plastics. A symmetrical hydrocarbon foundation.",
        keyTakeaways: ["Plastic precursor", "Isomer", "Polyester"],
        historicContext: HistoricContext(discoverer: "Auguste Cahours", year: 1850, impact: "Vital for polyester fiber production."),
        funFact: "Its symmetry gives it a much higher melting point than its ortho and meta isomers.",
        synthesisRoutes: [
            SynthesisRoute(name: "Isomerization", description: "Isomerization of mixed xylenes.", reactants: "Mixed Xylenes", conditions: "Zeolite Catalyst")
        ],
        chemClass: "Aromatics"
    ).toMolecule()

    static let water = MoleculeDefinition(
        name: "Water",
        formula: "H₂O",
        family: .inorganic,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 18.015,
        bondEnergy: 463,
        atoms: [
            A(.O, 0, 0, 0.1),
            A(.H, 0.76, 0.59, -0.2), 
            A(.H, -0.76, 0.59, -0.2)
        ],
        bonds: [B(0, 1), B(0, 2)],
        labMission: "The solvent of life. A polar molecule with unique properties due to hydrogen bonding.",
        keyTakeaways: ["Universal solvent", "Hydrogen bonding", "High heat capacity"],
        historicContext: HistoricContext(discoverer: "Henry Cavendish", year: 1781, impact: "Showed it was a compound, not an element."),
        funFact: "Hot water freezes faster than cold water under certain conditions (Mpemba effect).",
        synthesisRoutes: [
            SynthesisRoute(name: "Combustion", description: "Burning hydrogen in oxygen.", reactants: "2H₂ + O₂", conditions: "Spark")
        ],
        chemClass: "Inorganic"
    ).toMolecule()

    static let ammonia = MoleculeDefinition(
        name: "Ammonia",
        formula: "NH₃",
        family: .inorganic,
        hybridization: .sp3,
        bondType: .covalent,
        molarMass: 17.031,
        bondEnergy: 391,
        atoms: [
            A(.N, 0, 0.1, 0),
            A(.H, 0.94, -0.3, 0),
            A(.H, -0.47, -0.3, 0.81),
            A(.H, -0.47, -0.3, -0.81) 
        ],
        bonds: [B(0, 1), B(0, 2), B(0, 3)],
        labMission: "A pungent gas that feeds the world through fertilizer production.",
        keyTakeaways: ["Fertilizer", "Weak base", "Refrigerant"],
        historicContext: HistoricContext(discoverer: "Joseph Priestley", year: 1774, impact: "Precursor for nitrogenous compounds."),
        funFact: "It can dissolve alkali metals to form electrically conductive blue solutions.",
        synthesisRoutes: [
            SynthesisRoute(name: "Haber Process", description: "Direct combination of nitrogen and hydrogen.", reactants: "N₂ + 3H₂", conditions: "450°C, 200 atm, Fe Catalyst")
        ],
        chemClass: "Inorganic"
    ).toMolecule()

    static let carbonDioxide = MoleculeDefinition(
        name: "Carbon Dioxide",
        formula: "CO₂",
        family: .inorganic,
        hybridization: .sp,
        bondType: .covalent,
        molarMass: 44.01,
        bondEnergy: 799,
        atoms: [
            A(.C, 0, 0, 0),
            A(.O, 1.16, 0, 0),
            A(.O, -1.16, 0, 0) 
        ],
        bonds: [B(0, 1, 2), B(0, 2, 2)],
        labMission: "A linear molecule that regulates Earth's temperature and plant life.",
        keyTakeaways: ["Greenhouse gas", "Photosynthesis reactant", "Linear geometry"],
        historicContext: HistoricContext(discoverer: "Joseph Black", year: 1750, impact: "First gas to be distinguished from air."),
        funFact: "Frozen carbon dioxide (dry ice) sublimes directly into gas at -78.5°C.",
        synthesisRoutes: [
             SynthesisRoute(name: "Combustion", description: "Complete combustion of carbon.", reactants: "C + O₂", conditions: "Heat")
        ],
        chemClass: "Inorganic"
    ).toMolecule()

    static let sulfurHexafluoride = MoleculeDefinition(
        name: "Sulfur Hexafluoride",
        formula: "SF₆",
        family: .inorganic,
        hybridization: .sp3d2,
        bondType: .covalent,
        molarMass: 146.06,
        bondEnergy: 327,
        atoms: [
            A(.S, 0, 0, 0),
            A(.F, 1.5, 0, 0), A(.F, -1.5, 0, 0),
            A(.F, 0, 1.5, 0), A(.F, 0, -1.5, 0),
            A(.F, 0, 0, 1.5), A(.F, 0, 0, -1.5) 
        ],
        bonds: [B(0, 1), B(0, 2), B(0, 3), B(0, 4), B(0, 5), B(0, 6)],
        labMission: "The deep voice gas. A potent greenhouse gas with extreme dielectric strength.",
        keyTakeaways: ["High density", "Electrical insulator", "Octahedral"],
        historicContext: HistoricContext(discoverer: "Henri Moissan", year: 1901, impact: "Used to insulate high-voltage equipment."),
        funFact: "It is 5 times denser than air; you can float a foil boat on it.",
        synthesisRoutes: [
            SynthesisRoute(name: "Direct Fluorination", description: "Reaction of sulfur with fluorine.", reactants: "S₈ + 24F₂", conditions: "Heat")
        ],
        chemClass: "Inorganic"
    ).toMolecule()

    static let phosphorusPentachloride = MoleculeDefinition(
        name: "Phosphorus Pentachloride",
        formula: "PCl₅",
        family: .inorganic,
        hybridization: .sp3d,
        bondType: .covalent,
        molarMass: 208.24,
        bondEnergy: 330,
        atoms: [
            A(.P, 0, 0, 0),
            A(.Cl, 0, 2.0, 0), A(.Cl, 0, -2.0, 0), 
            A(.Cl, 1.7, 0, 0),
            A(.Cl, -0.85, 0, 1.47),
            A(.Cl, -0.85, 0, -1.47) 
        ],
        bonds: [B(0, 1), B(0, 2), B(0, 3), B(0, 4), B(0, 5)],
        labMission: "A reactive chlorinating agent with a shape-shifting structure.",
        keyTakeaways: ["Trigonal bipyramidal", "Chlorinating agent", "Lewis acid"],
        historicContext: HistoricContext(discoverer: "H. Davy", year: 1808, impact: "Fundamental to understanding expanded octets."),
        funFact: "In solid state, it exists as an ionic crystal [PCl4]+[PCl6]-, not PCl5 molecules.",
        synthesisRoutes: [
             SynthesisRoute(name: "Chlorination", description: "Chlorination of PCl3.", reactants: "PCl₃ + Cl₂", conditions: "Equlibrium")
        ],
        chemClass: "Inorganic"
    ).toMolecule()
}
