import AVFoundation
import AudioToolbox

@MainActor
class AudioManager {
    static let shared = AudioManager()

    private let engine = AVAudioEngine()
    private let playerNode = AVAudioPlayerNode()

    private let mixer = AVAudioMixerNode()

    private var isPlaying = false

    private init() {
        setupAudio()
    }

    private func setupAudio() {

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
        }

        engine.attach(playerNode)
        engine.attach(mixer)

        let format = engine.outputNode.inputFormat(forBus: 0)
        engine.connect(playerNode, to: mixer, format: format)
        engine.connect(mixer, to: engine.mainMixerNode, format: format)

        if let buffer = generateDroneBuffer(format: format) {

            playerNode.scheduleBuffer(buffer, at: nil, options: .loops, completionHandler: nil)
        }
    }

    func startAmbience() {
        guard !isPlaying else { return }

        do {
            try engine.start()

            mixer.outputVolume = 0

            isPlaying = true
        } catch {
        }
    }

    func updateStabilitySound(bondEnergy: Double) {
        guard isPlaying else { return }

        let normalized = min(1.0, max(0.0, Float(bondEnergy) / 8000.0))

        _ = 0.8 + (normalized * 0.4) 
        playerNode.rate = (0.5 + (normalized * 0.5)) 

    }

    func playNuclearEffect(type: String) {

        if type == "explosion" {

             AudioServicesPlaySystemSound(1520) 
        } else if type == "fusion" {
             AudioServicesPlaySystemSound(1519)
        }
    }

    private func generateDroneBuffer(format: AVAudioFormat) -> AVAudioPCMBuffer? {
        let frameCount = AVAudioFrameCount(format.sampleRate * 2.0) 
        guard let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: frameCount) else { return nil }

        buffer.frameLength = frameCount
        let channels = Int(format.channelCount)

        for ch in 0..<channels {
            guard let data = buffer.floatChannelData?[ch] else { continue }
            for n in 0..<Int(frameCount) {

                let t = Float(n) / Float(format.sampleRate)
                let freq: Float = 110.0 
                let sine = sin(2.0 * .pi * freq * t)
                let noise = (Float.random(in: -1...1) * 0.1)

                data[n] = (sine + noise) * 0.5
            }
        }

        return buffer
    }

    private func withAnimationVolume(to value: Float, duration: TimeInterval) {

        Task {
            let steps = 20
            let stepDuration = UInt64(duration / Double(steps) * 1_000_000_000)
            let startIso = mixer.outputVolume
            let delta = (value - startIso) / Float(steps)

            for _ in 0..<steps {
                try? await Task.sleep(nanoseconds: stepDuration)
                if abs(mixer.outputVolume - value) < abs(delta) {
                    mixer.outputVolume = value
                    return
                }
                mixer.outputVolume += delta
            }
            mixer.outputVolume = value 
        }
    }
}
