import Foundation

extension ChatViewModel {
    func fetchAIReply(for userMessage: String, completion: @escaping (String) -> Void) {
        // OpenAI API連携の雛形（現状はダミー返答）
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let reply = "（AIの返答）: " + userMessage.reversed()
            DispatchQueue.main.async {
                completion(reply)
            }
        }
    }
}