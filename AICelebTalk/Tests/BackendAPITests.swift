import XCTest
@testable import AICelebTalk

final class BackendAPITests: XCTestCase {
    func testCallMatchmaking() {
        let api = BackendAPI()
        let exp = expectation(description: "matchmaking")
        api.callMatchmaking(userId: "A") { users in
            XCTAssertTrue(users.contains("userB"))
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    func testCallLLM() {
        let api = BackendAPI()
        let exp = expectation(description: "llm")
        api.callLLM(prompt: "hello") { resp in
            XCTAssertNotNil(resp)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    func testUploadReplay() {
        let api = BackendAPI()
        let exp = expectation(description: "upload")
        api.uploadReplay(media: Data()) { ok in
            XCTAssertTrue(ok)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}