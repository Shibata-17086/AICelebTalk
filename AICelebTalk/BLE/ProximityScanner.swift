import Foundation
import CoreBluetooth

class ProximityScanner: NSObject, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    private var isScanning = false
    private let rssiThreshold = -80 // dBm
    private let scanIntervalForeground: TimeInterval = 1.0
    private let scanIntervalBackground: TimeInterval = 5.0
    private var scanTimer: Timer?
    private let onDetect: (String) -> Void
    
    init(onDetect: @escaping (String) -> Void) {
        self.onDetect = onDetect
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanning()
        } else {
            stopScanning()
        }
    }
    
    func startScanning() {
        guard !isScanning else { return }
        isScanning = true
        centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: true])
    }
    
    func stopScanning() {
        guard isScanning else { return }
        isScanning = false
        centralManager.stopScan()
        scanTimer?.invalidate()
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard RSSI.intValue >= rssiThreshold else { return }
        if let manufacturerData = advertisementData[CBAdvertisementDataManufacturerDataKey] as? Data, manufacturerData.count >= 16 {
            let ephemeralID = manufacturerData.prefix(16).map { String(format: "%02x", $0) }.joined()
            onDetect(ephemeralID)
        }
    }
}