import SwiftUI

struct DesignSystem {

    struct Colors {

        static let background = Color(hex: 0x050510)
        static let primary = Color(hex: 0x00D4F0)      
        static let secondary = Color(hex: 0xC77DFF)     
        static let accent = Color(hex: 0xFF6B9D)        

        static let textPrimary = Color.white
        static let textSecondary = Color.white.opacity(0.65)
        static let textTertiary = Color.white.opacity(0.4)

        static let cardFill = Color.white.opacity(0.06)
        static let elevatedFill = Color.white.opacity(0.10)
        static let separator = Color.white.opacity(0.08)

        static let glassBorder = Color.white.opacity(0.12)
        static let glassShadow = Color.black.opacity(0.35)
        static let glassHighlight = Color.white.opacity(0.06)
    }

    struct Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 24
        static let xxxl: CGFloat = 32
    }

    struct Radius {
        static let sm: CGFloat = 12
        static let md: CGFloat = 16
        static let lg: CGFloat = 20
        static let xl: CGFloat = 24
        static let pill: CGFloat = 100
    }

    struct Typography {
        static func largeTitle() -> Font {
            .system(.largeTitle, design: .rounded, weight: .bold)
        }

        static func title() -> Font {
            .system(.title, design: .rounded, weight: .bold)
        }

        static func heading(_ size: CGFloat = 22) -> Font {
            let style: Font.TextStyle = size > 20 ? .title2 : .headline
            return .system(style, design: .rounded, weight: .semibold)
        }

        static func body(_ size: CGFloat = 17) -> Font {
            let style: Font.TextStyle = size < 16 ? .subheadline : .body
            return .system(style, design: .default, weight: .regular)
        }

        static func caption() -> Font {
            .system(.caption, design: .default, weight: .medium)
        }

        static func monospaced(_ size: CGFloat = 15) -> Font {
            let style: Font.TextStyle = size < 14 ? .caption : (size > 16 ? .title3 : .subheadline)
            return .system(style, design: .monospaced, weight: .medium)
        }
    }

    struct Animations {
        static let fluidSpring: Animation = .spring(response: 0.45, dampingFraction: 0.75)
        static let bounceSpring: Animation = .spring(response: 0.35, dampingFraction: 0.65)
        static let gentleSpring: Animation = .spring(response: 0.5, dampingFraction: 0.85)
        static let slowFlow: Animation = .linear(duration: 10).repeatForever(autoreverses: true)
    }
}

struct GlassCard: ViewModifier {
    var cornerRadius: CGFloat = DesignSystem.Radius.lg
    var material: Material = .ultraThinMaterial
    var padding: CGFloat? = nil
    var highlight: Bool = true

    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(material)
                    .overlay(alignment: .top) {
                        if highlight {

                            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        colors: [Color.white.opacity(0.08), .clear],
                                        startPoint: .top,
                                        endPoint: .center
                                    )
                                )
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .strokeBorder(DesignSystem.Colors.glassBorder, lineWidth: 0.5)
                    )
                    .shadow(color: DesignSystem.Colors.glassShadow, radius: 12, x: 0, y: 6)
            }
    }
}

struct LiquidGlass: ViewModifier {
    var material: Material = .ultraThinMaterial
    var cornerRadius: CGFloat = DesignSystem.Radius.lg
    var borderOpacity: CGFloat = 0.12

    func body(content: Content) -> some View {
        content
            .background(material)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(Color.white.opacity(borderOpacity), lineWidth: 0.5)
            )
            .shadow(color: DesignSystem.Colors.glassShadow, radius: 12, x: 0, y: 6)
    }
}

extension View {
    func liquidGlass(material: Material = .ultraThinMaterial, cornerRadius: CGFloat = DesignSystem.Radius.lg) -> some View {
        self.modifier(LiquidGlass(material: material, cornerRadius: cornerRadius))
    }

    func glassCard(cornerRadius: CGFloat = DesignSystem.Radius.lg, material: Material = .ultraThinMaterial) -> some View {
        self.modifier(GlassCard(cornerRadius: cornerRadius, material: material))
    }

    func glow(color: Color, radius: CGFloat = 8) -> some View {
        self.shadow(color: color.opacity(0.5), radius: radius)
            .shadow(color: color.opacity(0.2), radius: radius * 2)
    }

    func subtleGlow(color: Color) -> some View {
        self.shadow(color: color.opacity(0.3), radius: 6)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
