import SwiftUI
import Charts

struct ReactorGameView: View {
    @Environment(\.dismiss) var dismiss

    @State private var coreTemperature: Double = 300.0 
    @State private var controlRodLevel: Double = 0.5 
    @State private var coolantFlow: Double = 0.5 

    @State private var timeInOptimalZone: TimeInterval = 0
    @State private var gameStatus: GameStatus = .playing
    @State private var gameLoopTask: Task<Void, Never>?
    @State private var showInstructions = true

    @State private var tempHistory: [TempDataPoint] = []

    struct TempDataPoint: Identifiable {
        let id = UUID()
        let time: Int
        let temp: Double
    }

    let optimalTempRange = 800.0...1000.0
    let meltdownTemp = 2000.0
    let scramTemp = 100.0
    let targetTime: TimeInterval = 20.0 

    enum GameStatus {
        case playing
        case won
        case meltdown
        case scram
    }

    var body: some View {
        ZStack {
            DesignSystem.Colors.background.ignoresSafeArea()

            Color.red
                .opacity(min(0.6, max(0, (coreTemperature - 800) / 1200)))
                .blur(radius: 50)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: coreTemperature)

            VStack(spacing: 0) {

                SimulationHeader(
                    title: "Reactor Manager",
                    subtitle: "Stabilize the Core",
                    onDismiss: {
                        gameLoopTask?.cancel()
                        dismiss()
                    }
                )

                if showInstructions {
                    InstructionsView(onStart: startGame)
                        .zIndex(10)
                } else {
                    GameplayView
                }
            }
        }

        .onDisappear {
            gameLoopTask?.cancel()
        }
    }

    var GameplayView: some View {
        VStack(spacing: DesignSystem.Spacing.xl) {

            ZStack {

                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().stroke(Color.white.opacity(0.1), lineWidth: 2)
                    )

                ForEach(0..<6) { i in
                    Capsule()
                        .fill(fuelColor)
                        .frame(width: 15, height: 100)
                        .offset(y: 20)
                        .rotationEffect(.degrees(Double(i) * 60))
                }

                ForEach(0..<6) { i in
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 12, height: 100)
                        .offset(y: -50 + (1.0 - controlRodLevel) * 100) 
                        .clipShape(Rectangle().offset(y: 50)) 
                        .rotationEffect(.degrees(Double(i) * 60))
                        .animation(.spring(response: 0.3), value: controlRodLevel)
                }

                ReactorParticleSystem(coreTemperature: coreTemperature)
                    .frame(width: 250, height: 250)

                VStack {
                    Text(String(format: "%.0f K", coreTemperature))
                        .font(DesignSystem.Typography.largeTitle())
                        .monospacedDigit()
                        .foregroundStyle(tempColor)
                        .shadow(color: tempColor.opacity(0.5), radius: 10)

                    Text(statusText)
                        .font(DesignSystem.Typography.caption())
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, DesignSystem.Spacing.xl)

            VStack(spacing: 8) {
                HStack {
                    Text("Core Temperature History")
                        .font(DesignSystem.Typography.caption())
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                    Spacer()
                    Text("Stability: \(Int((timeInOptimalZone / targetTime) * 100))%")
                        .font(DesignSystem.Typography.monospaced(12))
                        .foregroundStyle(DesignSystem.Colors.primary)
                }

                Chart {
                    ForEach(tempHistory) { point in
                        LineMark(
                            x: .value("Time", point.time),
                            y: .value("Temp (K)", point.temp)
                        )
                        .foregroundStyle(tempColor.gradient)
                        .interpolationMethod(.monotone)

                        AreaMark(
                            x: .value("Time", point.time),
                            yStart: .value("Optimal Low", 800),
                            yEnd: .value("Optimal High", 1000)
                        )
                        .foregroundStyle(Color.green.opacity(0.1))
                    }
                }
                .chartXAxis(.hidden)
                .chartYScale(domain: .automatic)
                .frame(height: 80)

                Text(gameStatus == .won ? "STABILIZED!" : (gameStatus == .playing ? "Keep Temp between 800K - 1000K" : "CRITICAL FAILURE"))
                    .font(DesignSystem.Typography.caption())
                    .foregroundStyle(gameStatus == .won ? .green : (gameStatus == .playing ? .gray : .red))
            }
            .padding(.horizontal, DesignSystem.Spacing.xl)

            Spacer()

            if gameStatus == .playing {
                VStack(spacing: DesignSystem.Spacing.lg) {

                    VStack(alignment: .leading) {
                        Text("Control Rods (Neutron Absorption)")
                            .font(DesignSystem.Typography.caption())
                            .foregroundStyle(DesignSystem.Colors.textSecondary)

                        Slider(value: $controlRodLevel, in: 0.0...1.0) {
                            Text("Control Rods")
                        } minimumValueLabel: {
                            Text("0%")
                        } maximumValueLabel: {
                            Text("100%")
                        }
                        .tint(.blue)
                    }

                    VStack(alignment: .leading) {
                        Text("Coolant Flow (Heat Removal)")
                            .font(DesignSystem.Typography.caption())
                            .foregroundStyle(DesignSystem.Colors.textSecondary)

                        Slider(value: $coolantFlow, in: 0.0...1.0) {
                            Text("Coolant")
                        } minimumValueLabel: {
                            Text("Min")
                        } maximumValueLabel: {
                            Text("Max")
                        }
                        .tint(.cyan)
                    }
                }
                .padding(DesignSystem.Spacing.xl)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: DesignSystem.Radius.xl, style: .continuous))
                .padding(.horizontal, DesignSystem.Spacing.md)
                .padding(.bottom, DesignSystem.Spacing.xl)
            } else {

                Button {
                    resetGame()
                } label: {
                    Text(gameStatus == .won ? "Simulation Complete" : "Restart Simulation")
                        .font(DesignSystem.Typography.heading())
                        .foregroundStyle(.white)
                        .padding()
                        .background(gameStatus == .won ? DesignSystem.Colors.primary : .red)
                        .clipShape(Capsule())
                }
                .padding(.bottom, 50)
            }
        }
    }

    func startGame() {
        withAnimation {
            showInstructions = false
        }
        startLoop()
    }

    func resetGame() {
        gameLoopTask?.cancel()
        coreTemperature = 300.0
        controlRodLevel = 0.5
        coolantFlow = 0.5
        timeInOptimalZone = 0
        tempHistory.removeAll()
        gameStatus = .playing
        startLoop()
    }

    func startLoop() {
        gameLoopTask?.cancel()
        gameLoopTask = Task { @MainActor in
            var tick = 0
            while !Task.isCancelled && gameStatus == .playing {
                updatePhysics(tick: tick)
                tick += 1
                try? await Task.sleep(for: .milliseconds(100))
            }
        }
    }

    func updatePhysics(tick: Int) {
        guard gameStatus == .playing else { return }

        let reactionRate = (1.0 - controlRodLevel) * 50.0 

        let coolingRate = (coolantFlow * 30.0) + (coreTemperature * 0.01)

        let deltaTemp = reactionRate - coolingRate
        coreTemperature += deltaTemp

        coreTemperature += Double.random(in: -2...2)
        coreTemperature = max(0, coreTemperature)

        tempHistory.append(TempDataPoint(time: tick, temp: coreTemperature))
        if tempHistory.count > 100 { tempHistory.removeFirst() } 

        if coreTemperature >= meltdownTemp {
            gameStatus = .meltdown
            gameLoopTask?.cancel()
            HapticManager.shared.playNuclearExplosion() 
        } else if coreTemperature <= scramTemp {
            gameStatus = .scram
            gameLoopTask?.cancel()
        } else if optimalTempRange.contains(coreTemperature) {
            timeInOptimalZone += 0.1
            if timeInOptimalZone >= targetTime {
                gameStatus = .won
                gameLoopTask?.cancel()
                HapticManager.shared.playSuccess()
            }
        }

        if coreTemperature > 1500 {
            HapticManager.shared.playWarning()
        }
    }

    var fuelColor: Color {

        if coreTemperature < 800 { return .blue }
        if coreTemperature < 1500 { return .orange }
        return .red
    }

    var tempColor: Color {
        if optimalTempRange.contains(coreTemperature) { return .green }
        if coreTemperature > 1800 { return .red }
        return .white
    }

    var statusText: String {
        if coreTemperature < 800 { return "Heating Up..." }
        if coreTemperature > 1200 { return "WARNING: HIGH TEMP" }
        return "Optimal"
    }
}

struct InstructionsView: View {
    let onStart: () -> Void

    var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(.largeTitle))
                .foregroundStyle(.yellow)

            Text("Reactor Stabilization")
                .font(DesignSystem.Typography.title())
                .foregroundStyle(.white)

            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                InstructionRow(icon: "arrow.up.and.down", text: "Control Rods manage reaction rate.")
                InstructionRow(icon: "drop.fill", text: "Coolant removes heat.")
                InstructionRow(icon: "checkmark.circle.fill", text: "Keep Temp between 800K - 1000K for 20s.")
            }
            .padding()
            .background(.white.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Button(action: onStart) {
                Text("Start Simulation")
                    .font(DesignSystem.Typography.heading())
                    .foregroundStyle(.black)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(DesignSystem.Colors.primary)
                    .clipShape(Capsule())
            }
        }
        .padding(DesignSystem.Spacing.xxl)
        .background(Material.regular)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(DesignSystem.Spacing.xl)
    }
}

struct InstructionRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30)
                .foregroundStyle(DesignSystem.Colors.primary)
            Text(text)
                .font(DesignSystem.Typography.body())
                .foregroundStyle(.white)
        }
    }
}

extension HapticManager {
    func playSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    func playWarning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
}
