import XCTest
@testable import AICelebTalk

final class SessionManagerTests: XCTestCase {
    func testSessionLifecycle() {
        let manager = SessionManager()
        XCTAssertEqual(manager.state, .idle)
        manager.startSession(with: "userB")
        XCTAssertEqual(manager.state, .active)
        manager.closeSession()
        XCTAssertEqual(manager.state, .closed)
    }
}