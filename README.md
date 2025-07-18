# AIすれ違いアバター・プラットフォーム iOS クライアント

## セットアップ手順

1. 必要ツールのインストール

```sh
brew install cocoapods swiftlint
```

2. 依存ライブラリのインストール

```sh
pod install
```

3. プロジェクトを開く

```sh
open App.xcworkspace
```

---

## テスト実行

```sh
xcodebuild test -scheme AICelebTalk -destination 'platform=iOS Simulator,name=iPhone 15'
```

---

## CI/CD
- Lint: SwiftLint
- Test: XCTest
- Build: fastlane, Xcode Cloud
- Deploy: Firebase App Distribution / TestFlight

---

## ライセンス
- Live2D SDK: SDK Release License（年商10M JPY未満は無償）
- VOICEVOX: MIT
- UWB API: Apple NDA

---

## 開発Tips
- BLE/UWBは実機でのみ動作確認可能
- VOICEVOX CoreはFFIバインディングが必要
- gRPC/REST APIはモック実装から本番APIへ差し替え可

---

## ディレクトリ構成（予定）

- AppDelegate.swift
- BLE/
  - ProximityScanner.swift
  - EphemeralAdvertiser.swift
- Session/
  - SessionManager.swift
  - Handshake.swift
  - SessionLog.swift
  - SessionLogStore.swift
- AI/
  - LLMClient.swift
  - PromptBuilder.swift
- TTS/
  - VoiceVoxWrapper.swift
- Live2D/
  - AvatarView.swift
  - MotionController.swift
- UI/
  - HomeView.swift
  - ReplayTimelineView.swift
  - ChatView.swift