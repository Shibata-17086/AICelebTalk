import Foundation

class LLMClient {
    private var webSocketTask: URLSessionWebSocketTask?
    private let url = URL(string: "wss://example.com/v1/llm/stream")! // 仮
    
    func connect() {
        let session = URLSession(configuration: .default)
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.resume()
    }
    
    func sendPrompt(_ prompt: String, completion: @escaping (String?) -> Void) {
        let message = URLSessionWebSocketTask.Message.string(prompt)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("Send error: \(error)")
                completion(nil)
                return
            }
            self.receive(completion: completion)
        }
    }
    
    private func receive(completion: @escaping (String?) -> Void) {
        webSocketTask?.receive { result in
            switch result {
            case .success(let message):
                if case let .string(text) = message {
                    completion(text)
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print("Receive error: \(error)")
                completion(nil)
            }
        }
    }
    
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
}