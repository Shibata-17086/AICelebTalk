import Foundation
import SwiftUI

struct AvatarView: View {
    var emotion: String = "neutral"
    var wavData: Data? = nil
    
    var body: some View {
        VStack {
            // Live2Dキャラ表示（SDK連携は省略）
            Text("Live2D Avatar: \(emotion)")
            // wavDataを使ってリップシンク（省略）
        }
    }
}