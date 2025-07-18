import SwiftUI

@main
struct AICelebTalkApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ReplayTimelineView(sessionLogs: sampleSessionLogs)
                .tabItem {
                    Label("Replay", systemImage: "clock.arrow.circlepath")
                }
            ChatView(sessionLog: sampleSessionLogs.first!)
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            AvatarView()
                .tabItem {
                    Label("Avatar", systemImage: "person.crop.circle")
                }
        }
    }
}

// サンプルデータ
let sampleSessionLogs: [SessionLog] = [
    SessionLog(
        id: "session1",
        userAId: "A",
        userBId: "B",
        startedAt: Date(),
        turns: [
            Turn(speaker: .agentA, text: "こんにちは", emotion: .joy, offset: 0),
            Turn(speaker: .agentB, text: "やあ！", emotion: .neutral, offset: 2)
        ],
        replayPublic: true,
        status: .active
    )
]