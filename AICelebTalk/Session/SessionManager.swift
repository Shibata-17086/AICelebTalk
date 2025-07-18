import Foundation

class SessionManager: ObservableObject {
    enum State {
        case idle, scanning, candidateFound, handshake, active, closed
    }
    @Published var state: State = .idle
    @Published var sessionKey: Data?
    @Published var candidateID: String?
    private let logStore = SessionLogStore()
    private var currentLog: SessionLog?
    
    func startSession(with candidateID: String) {
        self.candidateID = candidateID
        self.state = .candidateFound
        performHandshake()
        // セッションログ初期化
        currentLog = SessionLog(
            id: UUID().uuidString,
            userAId: "A", userBId: candidateID,
            startedAt: Date(),
            turns: [], replayPublic: false, status: .active
        )
    }
    
    private func performHandshake() {
        self.state = .handshake
        let privateKey = Data(repeating: 0x01, count: 32)
        let publicKey = Data(repeating: 0x02, count: 32)
        self.sessionKey = Data(repeating: 0xAA, count: 32)
        self.state = .active
    }
    
    func closeSession() {
        self.state = .closed
        self.sessionKey = nil
        self.candidateID = nil
        if var log = currentLog {
            log.status = .closed
            logStore.save(log: log) { _ in }
        }
        currentLog = nil
    }
}