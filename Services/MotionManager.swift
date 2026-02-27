@preconcurrency import CoreMotion
import SwiftUI

@Observable @MainActor
final class MotionManager {
    var pitch: Double = 0.0
    var roll: Double = 0.0
    var isShaking: Bool = false
    
    private let maxAngle: Double = 0.25
    private let shakeThreshold: Double = 2.5
    
    private let motionManager = CMMotionManager()
    private var shakeResetTask: Task<Void, Never>?

    init() {
        startTracking()
    }

    func startTracking() {
        guard motionManager.isDeviceMotionAvailable else { return }
        
        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        
        let maxA = maxAngle
        let threshold = shakeThreshold
        
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (data, error) in
            guard let data = data, let self = self else { return }
            
            let rawPitch = data.attitude.pitch
            let rawRoll = data.attitude.roll
            
            let clampedPitch = min(max(rawPitch * 0.5, -maxA), maxA)
            let clampedRoll = min(max(rawRoll * 0.5, -maxA), maxA)
            
            self.pitch = clampedPitch
            self.roll = clampedRoll
            
            let accel = data.userAcceleration
            let magnitude = sqrt(accel.x * accel.x + accel.y * accel.y + accel.z * accel.z)
            
            if magnitude > threshold && !self.isShaking {
                self.isShaking = true
                self.shakeResetTask?.cancel()
                self.shakeResetTask = Task { @MainActor in
                    try? await Task.sleep(nanoseconds: 800_000_000)
                    self.isShaking = false
                }
            }
        }
    }

    func stopTracking() {
        motionManager.stopDeviceMotionUpdates()
    }
    
    deinit {
        motionManager.stopDeviceMotionUpdates()
    }
}
