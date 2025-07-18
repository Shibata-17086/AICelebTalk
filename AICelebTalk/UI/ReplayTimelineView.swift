import SwiftUI

struct ReplayTimelineView: View {
    var sessionLogs: [SessionLog]
    
    var body: some View {
        List(sessionLogs) { log in
            VStack(alignment: .leading) {
                Text("Session: \(log.id)")
                Text("Started: \(log.startedAt)")
                Text("Status: \(log.status == .active ? "Active" : "Closed")")
            }
        }
    }
}