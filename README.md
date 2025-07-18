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

## ディレクトリ構成（予定）

- AppDelegate.swift
- BLE/
  - ProximityScanner.swift
  - EphemeralAdvertiser.swift
- Session/
  - SessionManager.swift
  - Handshake.swift
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