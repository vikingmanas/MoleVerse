import SwiftUI
import RealityKit

enum Element: String, CaseIterable, Sendable {
    case H, He, Li, Be, B, C, N, O, F, Ne, Na, Mg, Al, Si, P, S, Cl, Ar, K, Ca, Br, I, Xe
    
    var name: String {
        switch self {
        case .H: return "Hydrogen"
        case .He: return "Helium"
        case .Li: return "Lithium"
        case .Be: return "Beryllium"
        case .B: return "Boron"
        case .C: return "Carbon"
        case .N: return "Nitrogen"
        case .O: return "Oxygen"
        case .F: return "Fluorine"
        case .Ne: return "Neon"
        case .Na: return "Sodium"
        case .Mg: return "Magnesium"
        case .Al: return "Aluminium"
        case .Si: return "Silicon"
        case .P: return "Phosphorus"
        case .S: return "Sulfur"
        case .Cl: return "Chlorine"
        case .Ar: return "Argon"
        case .K: return "Potassium"
        case .Ca: return "Calcium"
        case .Br: return "Bromine"
        case .I: return "Iodine"
        case .Xe: return "Xenon"
        }
    }
    
    var atomicMass: Double {
        switch self {
        case .H: return 1.008
        case .C: return 12.011
        case .N: return 14.007
        case .O: return 15.999
        case .F: return 18.998
        case .Cl: return 35.45
        case .Br: return 79.904
        case .Xe: return 131.29
        
        default: return 0.0
        }
    }
    
    var electronegativity: Double {
        switch self {
        case .H: return 2.20
        case .C: return 2.55
        case .N: return 3.04
        case .O: return 3.44
        case .F: return 3.98
        case .Cl: return 3.16
        case .Br: return 2.96
        case .Xe: return 2.60
        default: return 0.0
        }
    }
    
    var cpkColor: Color {
        switch self {
        case .H: return .white
        case .C: return .black
        case .N: return .blue
        case .O: return .red
        case .F, .Cl: return .green
        case .Br: return Color(hex: 0x8B0000)
        case .I: return Color(hex: 0x940094)
        case .Xe: return Color(hex: 0x429E9D)
        case .S: return .yellow
        case .P: return .orange
        default: return .gray
        }
    }
    
    
    var radius: Float {
        switch self {
        case .H: return 0.25
        case .C: return 0.35
        case .N: return 0.32
        case .O: return 0.30
        case .F: return 0.28
        case .Cl: return 0.40
        case .Br: return 0.45
        case .S: return 0.40
        case .Xe: return 0.50
        default: return 0.30
        }
    }
    var validValencies: [Int] {
        switch self {
        case .H, .F, .Cl, .Br, .I, .Na, .K, .Li: return [1]
        case .O, .Ca, .Mg, .Be: return [2, 3]
        case .S: return [2, 4, 6]
        case .N: return [3, 4, 5]
        case .P: return [3, 5]
        case .C, .Si: return [4]
        case .B, .Al: return [3, 4]
        case .He, .Ne, .Ar: return [0] 
        case .Xe: return [0, 2, 4, 6, 8] 
        }
    }
}
