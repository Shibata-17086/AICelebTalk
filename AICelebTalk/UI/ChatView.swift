import SwiftUI

struct ChatView: View {
    var sessionLog: SessionLog
    
    var body: some View {
        List(sessionLog.turns.indices, id: \ .self) { idx in
            let turn = sessionLog.turns[idx]
            HStack {
                Text(turn.speaker == .agentA ? "A" : "B")
                    .bold()
                Text(turn.text)
                Spacer()
                Text("[\(turn.emotion)]")
            }
        }
    }
}