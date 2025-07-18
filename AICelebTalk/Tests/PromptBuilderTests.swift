import XCTest
@testable import AICelebTalk

final class PromptBuilderTests: XCTestCase {
    func testBuildPrompt() {
        let builder = PromptBuilder()
        let prompt = builder.buildPrompt(system: "sys", persona: "p", partnerProfile: "pp", safety: "s")
        XCTAssertTrue(prompt.contains("SYSTEM: sys"))
        XCTAssertTrue(prompt.contains("PERSONA: p"))
        XCTAssertTrue(prompt.contains("PARTNER: pp"))
        XCTAssertTrue(prompt.contains("SAFETY: s"))
    }
}