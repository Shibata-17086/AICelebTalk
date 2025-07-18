import XCTest
@testable import AICelebTalk

final class MotionControllerTests: XCTestCase {
    func testMapEmotion() {
        let mc = MotionController()
        XCTAssertEqual(mc.mapEmotion("joy"), "joy")
        XCTAssertEqual(mc.mapEmotion("fear"), "fear")
        XCTAssertEqual(mc.mapEmotion("neutral"), "neutral")
        XCTAssertEqual(mc.mapEmotion("sad"), "sad")
        XCTAssertEqual(mc.mapEmotion("unknown"), "neutral")
    }
}