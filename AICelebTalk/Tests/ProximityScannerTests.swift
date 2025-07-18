import XCTest
@testable import AICelebTalk

final class ProximityScannerTests: XCTestCase {
    func testOnDetectCallback() {
        let exp = expectation(description: "onDetect")
        let scanner = ProximityScanner(onDetect: { id in
            XCTAssertEqual(id.count, 32) // 16byte hex
            exp.fulfill()
        })
        // BLEスキャンのモック呼び出し（本来はCoreBluetoothをモック化）
        scanner.centralManager(nil, didDiscover: CBPeripheral(), advertisementData: [CBAdvertisementDataManufacturerDataKey: Data(repeating: 0x01, count: 16)], rssi: NSNumber(value: -70))
        wait(for: [exp], timeout: 1)
    }
}