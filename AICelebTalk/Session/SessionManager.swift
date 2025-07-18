import Foundation

class SessionManager: ObservableObject {
    enum State {
        case idle, scanning, candidateFound, handshake, active, closed
    }
    @Published var state: State = .idle
    @Published var sessionKey: Data?
    @Published var candidateID: String?
    
    func startSession(with candidateID: String) {
        self.candidateID = candidateID
        self.state = .candidateFound
        performHandshake()
    }
    
    private func performHandshake() {
        self.state = .handshake
        // ECDH鍵ペア生成（雛形）
        let privateKey = Data(repeating: 0x01, count: 32) // 仮
        let publicKey = Data(repeating: 0x02, count: 32) // 仮
        // 相手の公開鍵とECDH計算→HKDFでセッション鍵生成（省略）
        // ...
        self.sessionKey = Data(repeating: 0xAA, count: 32) // 仮
        self.state = .active
    }
    
    func closeSession() {
        self.state = .closed
        self.sessionKey = nil
        self.candidateID = nil
    }
}