import SwiftUI

struct HomeView: View {
    @StateObject private var scannerVM = ProximityScannerViewModel()
    @StateObject private var sessionManager = SessionManager()
    
    var body: some View {
        VStack {
            Text("AIすれ違いアバター・プラットフォーム")
                .font(.title)
                .padding()
            List(scannerVM.detectedIDs, id: \ .self) { id in
                HStack {
                    Text("Ephemeral ID: \(id)")
                    Spacer()
                    Button("Connect") {
                        sessionManager.startSession(with: id)
                    }
                }
            }
            Button(scannerVM.isScanning ? "Stop Scan" : "Start Scan") {
                scannerVM.toggleScan()
            }
            .padding()
            Text("Session State: \(String(describing: sessionManager.state))")
                .padding()
        }
    }
}

class ProximityScannerViewModel: ObservableObject {
    @Published var detectedIDs: [String] = []
    @Published var isScanning = false
    private var scanner: ProximityScanner?
    
    func toggleScan() {
        if isScanning {
            scanner?.stopScanning()
            isScanning = false
        } else {
            scanner = ProximityScanner(onDetect: { [weak self] id in
                DispatchQueue.main.async {
                    if !self!.detectedIDs.contains(id) {
                        self?.detectedIDs.append(id)
                    }
                }
            })
            scanner?.startScanning()
            isScanning = true
        }
    }
}

#Preview {
    HomeView()
}