import Foundation

class VoiceVoxWrapper {
    // VOICEVOX CoreとのFFI連携雛形
    // バッテリー40%以上＆AC接続時のみ生成（実装は省略）
    func synthesize(text: String, completion: @escaping (Data?) -> Void) {
        // 非同期でWAVデータ生成（仮実装）
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            completion(Data())
        }
    }
}