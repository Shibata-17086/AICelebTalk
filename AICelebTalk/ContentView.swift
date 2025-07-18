import SwiftUI
import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var inputText: String = ""
    @Published var isLoading: Bool = false
    private let historyStore = ChatHistoryStore()
    
    init() {
        messages = historyStore.load()
    }
    
    func sendMessage() {
        guard !inputText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let userMessage = Message(text: inputText, isUser: true)
        messages.append(userMessage)
        let userInput = inputText
        inputText = ""
        isLoading = true
        fetchAIReply(for: userInput) { [weak self] reply in
            guard let self = self else { return }
            let aiReply = Message(text: reply, isUser: false)
            self.messages.append(aiReply)
            self.historyStore.save(messages: self.messages)
            self.isLoading = false
        }
    }
    
    func clearHistory() {
        messages.removeAll()
        historyStore.clear()
    }
}

struct ContentView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    viewModel.clearHistory()
                }) {
                    Image(systemName: "trash")
                    Text("履歴クリア")
                }
                .foregroundColor(.red)
            }
            .padding([.top, .trailing])
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            HStack {
                                if message.isUser {
                                    Spacer()
                                    Text(message.text)
                                        .padding()
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(10)
                                } else {
                                    Text(message.text)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }
                .onChange(of: viewModel.messages.count) { _ in
                    if let last = viewModel.messages.last {
                        withAnimation {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
            }
            HStack {
                TextField("メッセージを入力", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    viewModel.sendMessage()
                }) {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Text("送信")
                    }
                }
                .disabled(viewModel.isLoading)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}