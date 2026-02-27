import CoreHaptics
import UIKit

@MainActor
class HapticManager {
    static let shared = HapticManager()

    private var engine: CHHapticEngine?

    private init() {
        prepareHaptics()
    }

    private func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()

            engine?.resetHandler = { [weak self] in
                do {
                    try self?.engine?.start()
                } catch {
                }
            }
        } catch {
        }
    }

    func playOrbitFeedback() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.4)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)

        playPattern(events: [event])
    }

    func playBondStretch(intensity: Float) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        let clampedIntensity = max(0, min(1, intensity))

        let hapticIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: clampedIntensity)
        let hapticSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: clampedIntensity * 0.5)

        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [hapticIntensity, hapticSharpness], relativeTime: 0, duration: 0.1)

        playPattern(events: [event])
    }

    func playNuclearExplosion() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        let rumbleIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let rumbleSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.0)
        let rumble = CHHapticEvent(eventType: .hapticContinuous, parameters: [rumbleIntensity, rumbleSharpness], relativeTime: 0, duration: 0.8)

        let crackIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let crackSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let crack = CHHapticEvent(eventType: .hapticTransient, parameters: [crackIntensity, crackSharpness], relativeTime: 0.8)

        playPattern(events: [rumble, crack])
    }

    func playFusionBuildup() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        var events: [CHHapticEvent] = []

        for i in 0..<10 {
            let time = Double(i) * 0.1
            let progress = Float(i) / 10.0

            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.3 + (progress * 0.7))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.2 + (progress * 0.8))

            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: time)
            events.append(event)
        }

        let popIntensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let popSharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let pop = CHHapticEvent(eventType: .hapticTransient, parameters: [popIntensity, popSharpness], relativeTime: 1.0)
        events.append(pop)

        playPattern(events: events)
    }

    private func playPattern(events: [CHHapticEvent]) {
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
        }
    }
}
