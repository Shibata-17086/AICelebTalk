import XCTest
@testable import AICelebTalk

final class VoiceVoxWrapperTests: XCTestCase {
    func testSynthesize() {
        let wrapper = VoiceVoxWrapper()
        let exp = expectation(description: "synthesize")
        wrapper.synthesize(text: "こんにちは") { data in
            XCTAssertNotNil(data)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2)
    }
}