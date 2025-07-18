import Foundation
import CoreBluetooth

class ProximityScanner: NSObject, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        // BLEの状態変化に応じてスキャン開始/停止を制御
    }
    
    func startScanning() {
        // スキャン開始処理
    }
    
    func stopScanning() {
        // スキャン停止処理
    }
}