import XCTest
@testable import AICelebTalk

final class SessionLogStoreTests: XCTestCase {
    func testSaveAndDelete() {
        let store = SessionLogStore()
        let log = SessionLog(id: "id1", userAId: "A", userBId: "B", startedAt: Date(), turns: [], replayPublic: false, status: .active)
        let exp = expectation(description: "save")
        store.save(log: log) { success in
            XCTAssertTrue(success)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
        let delExp = expectation(description: "delete")
        store.delete(sessionId: "id1") { success in
            XCTAssertTrue(success)
            delExp.fulfill()
        }
        wait(for: [delExp], timeout: 1)
    }
    func testNSFWCheck() {
        let store = SessionLogStore()
        let exp = expectation(description: "nsfw")
        store.checkNSFW(mediaData: Data()) { safe in
            XCTAssertTrue(safe)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}