# search repo
一覧(Light)(日本語)|一覧(Dark)（英語）
--|--
![Simulator Screenshot - iPhone 14 Pro Max - 2023-09-10 at 21 11 56](https://github.com/taka392/github_repo/assets/88756420/216c2723-dd77-4ee7-8900-45eed6fd9837)|![Simulator Screenshot - iPhone 14 Pro Max - 2023-09-10 at 21 26 16](https://github.com/taka392/github_repo/assets/88756420/a4127e97-65ef-495d-9c21-0f916a1e89d7)

タブレット(Light)(日本語)|デスクトップ(Dark)（英語）
--|--
![iPad](https://github.com/taka392/github_repo/assets/88756420/9762cc3c-cd46-4eaf-ae70-47e6216e26e4)|![MacOS](https://github.com/taka392/github_repo/assets/88756420/38c3f866-2589-4671-92cf-7ed7297938b4)


0件(Light)(日本語)|日本語(Dark)
--|--
![Simulator Screenshot - iPhone 14 Pro Max - 2023-09-10 at 21 12 45](https://github.com/taka392/github_repo/assets/88756420/7b4a2bb4-6e9e-4ef6-beb4-9a62d3f7fc85)|![Simulator Screenshot - iPhone 14 Pro Max - 2023-09-10 at 21 29 21](https://github.com/taka392/github_repo/assets/88756420/af4866f0-cf43-4a5f-a697-3f887633d901)

エラー(Light)(日本語)|(英語)詳細画面
--|--
![Simulator Screenshot - iPhone 14 Pro Max - 2023-09-10 at 21 23 49](https://github.com/taka392/github_repo/assets/88756420/c01f757a-09f5-4e56-adb6-dca421bbe32a)!|![Simulator Screenshot - iPhone 14 Pro Max - 2023-09-10 at 21 19 26](https://github.com/taka392/github_repo/assets/88756420/963610f0-707f-4e9a-90fc-f7b4305b500a)

![](https://media.giphy.com/media/Xw7GrCRFpDtDrfV1DI/giphy.gif)


### 動作

* 何かしらのキーワードを入力できる
* 入力したキーワードで GitHub のリポジトリを検索できる
* 検索結果は一覧で概要（リポジトリ名）を表示する
* 検索結果のアイテムをタップしたら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue
  数）を表示する




## アーキテクチャ / パッケージ
・[CODE WITH ANDREA](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)と
[こちら](https://www.youtube.com/watch?v=UMpInO2giz4&t=359s) の動画を参考にして、本アプリは下記の３層アーキテクチャで実装しています。
![アーキテクチャ図](https://user-images.githubusercontent.com/13707135/200081763-c2809366-046d-4a82-8367-9bee5a751b90.png)


## フォルダ構成

```  
├── application                              アプリケーション層
│   └──di                                     依存性を注
│   └──state　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 状態を管理
│   └──types　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 enum等
│   └──usecase　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 一連の処理
├── domain                                   ドメイン層
│   └──types                                  model
│   └──interface                              リポジトリのインターフェイス
├── infrastructure                           インフラストラクチャ層
│   └──reppo                                  リポジトリの実態
├── presentation　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　プレゼンテーション層
│   └──page　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 ページ
│   └──router　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 ルーティング
│   └──them　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 テーマ設定
│   └──widget　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 コンポーネント
```



## 環境

|         | Version |
|---------|---------|
| Flutter | 3.13.10 |
| Dart    | 3.1.0   |





### UI/UX

* エラー発生時の処理
* 様々な画面サイズ対応
* Theme の適切な利用・ダークモードの対応
* 多言語対応 (英語、日本語)
* 検索結果の並び替え


## 使用技術、パッケージ

* GitHub ActionsによるCI
* flutter_riverpod -状態管理
* freezed_annotation -freezedファイル生成
* riverpod_annotation-Providerのファイル生成
* lottie -アニメーション
* go_router -ルーティング
* tuple　-引数を複数指定
* url_launcher -URLを表示
* http -apiの実装
* intl -言語、数字の成形
* json_annotation -jsonの変換
* flutter_localizations -多言語対応
* device_preview -各サイズの画面でUIの確認

----dev----

* flutter_test -テスト
* flutter_lints -静的解析
* build_runner -ファイルの生成
* freezed -immutableなクラス作成、json変換を簡単に
* json_serializable -jsonの変換
* mockito -データをモック化してテスト
* import_sorter -importの整列

## テスト
### Widgetテスト
* レスポンシブ対応のテスト
* Error,Loading,Empty時に適切なUIが表示がされているか
* 入力フォームのテスト
* ドロップダウンのUIテスト
* Themの切り替えテスト


### Unitテスト
* 追加スクロールのテスト
* リフレッシュ処理のテスト
* 検索処理のテスト
* 並び替えのテスト
* データ取得メソッドのテスト


## CI
* mainにプルリクエストが出た時に発火する
* freezedの生成
* テストを全て通過するか
* 静的解析の確認


## ビルド手順

・クローン

```
git clone https://github.com/taka392/search_repo.git
```

・fvm読み込み

 ```
 fvm install
 ```

・依存関係を読み込む（多言語対応も読み込まれます）

```
fvm flutter pub get
```

・freezed等のコード生成

```
fvm flutter pub run build_runner build -d
```

・ビルドラン

```
fvm flutter run
```

