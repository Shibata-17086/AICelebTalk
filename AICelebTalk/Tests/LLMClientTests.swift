import XCTest
@testable import AICelebTalk

final class LLMClientTests: XCTestCase {
    func testModerationSafe() {
        let client = LLMClient()
        let exp = expectation(description: "moderation")
        client.moderate(text: "hello") { isSafe in
            XCTAssertTrue(isSafe)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    func testModerationUnsafe() {
        let client = LLMClient()
        let exp = expectation(description: "moderation")
        client.moderate(text: "hate speech") { isSafe in
            XCTAssertFalse(isSafe)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
    func testFallbackToMistral() {
        let client = LLMClient()
        let exp = expectation(description: "fallback")
        client.sendPrompt("") { response in
            XCTAssertNotNil(response)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}