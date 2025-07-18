import Foundation

class SessionLogStore {
    // Firestore: TTL 30日、Proは365日
    // S3: replay/YYYY/MM/dd/<session_id>/
    func save(log: SessionLog, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    func fetchAll(completion: @escaping ([SessionLog]) -> Void) {
        completion([])
    }
    // GDPR “Right to Delete”
    func delete(sessionId: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    // リプレイ公開前 NSFW検出API（雛形）
    func checkNSFW(mediaData: Data, completion: @escaping (Bool) -> Void) {
        // 本来はNSFW API呼び出し。ここでは仮実装。
        completion(true)
    }
}