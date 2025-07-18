import Foundation

class BackendAPI {
    // 認証: OIDC JWT (Auth0)
    var jwtToken: String? = nil
    
    // gRPC/REST API雛形
    func callMatchmaking(userId: String, completion: @escaping ([String]) -> Void) {
        // Neo4j Aura (v5) で候補取得（仮実装）
        completion(["userB", "userC"])
    }
    func callLLM(prompt: String, completion: @escaping (String?) -> Void) {
        // LLM Proxy経由でOpenAI/Mistral呼び出し（仮実装）
        completion("LLM応答: " + prompt)
    }
    func uploadReplay(media: Data, completion: @escaping (Bool) -> Void) {
        // S3アップロード（仮実装）
        completion(true)
    }
    func fetchReplay(sessionId: String, completion: @escaping (Data?) -> Void) {
        // S3からリプレイ取得（仮実装）
        completion(nil)
    }
}