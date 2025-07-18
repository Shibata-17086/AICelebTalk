import Foundation

struct SessionLog: Identifiable, Codable {
    let id: String // session_id
    let userAId: String
    let userBId: String
    let startedAt: Date
    var turns: [Turn]
    var replayPublic: Bool
    var status: Status
    
    enum Status: Int, Codable {
        case active = 0, closed = 1
    }
}

struct Turn: Codable {
    enum Speaker: Int, Codable {
        case agentA = 0, agentB = 1
    }
    let speaker: Speaker
    let text: String
    let emotion: Emotion
    let offset: Float // seconds
}

enum Emotion: Int, Codable {
    case neutral = 0, joy = 1, sad = 2, anger = 3, surprise = 4
}