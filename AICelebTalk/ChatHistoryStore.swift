import Foundation

class ChatHistoryStore {
    private let key = "chat_history"
    
    func save(messages: [Message]) {
        if let data = try? JSONEncoder().encode(messages) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func load() -> [Message] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let messages = try? JSONDecoder().decode([Message].self, from: data) else {
            return []
        }
        return messages
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}