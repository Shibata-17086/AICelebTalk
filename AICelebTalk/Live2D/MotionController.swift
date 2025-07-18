import Foundation

class MotionController {
    // Live2Dモーション制御の雛形
    func mapEmotion(_ emotion: String) -> String {
        switch emotion.lowercased() {
        case "joy": return "joy"
        case "fear": return "fear"
        case "neutral": return "neutral"
        case "sad": return "sad"
        default: return "neutral"
        }
    }
}