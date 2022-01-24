# Hello Rails Hotwire

## 概要

Rails7、Hotwireを使ったサンプル。
- 参考: https://qiita.com/kagesumi3m/items/c19e1cc3430b88d8bbec

## スタック

- Ruby 3
- Rails 7
  - Hotwire
- PostgreSQL

## セットアップ

1. セットアップ用環境の作成
   1. セットアップ用資材を設置するディレクトリを準備する。
   2. 以下を設定する。
      ```
      % bundle init
      echo "gem 'rails', '~>7.0.1'" >> Gemfile
      echo "gem 'bootsnap'" >> Gemfile
      echo "gem 'importmap-rails'" >> Gemfile
      echo "gem 'turbo-rails'" >> Gemfile
      echo "gem 'stimulus-rails'" >> Gemfile
      echo "gem 'sprockets-rails'" >> Gemfile
      bundle config set --local path vendor/bundle
      bundle install
      ```
    - posrgresqlが起動していないとpgのインストールでエラーになる。
2. セットアップコマンドを実行する。
    ```
    % bundle exec rails new ../{プロジェクト名} -d postgresql --skip-jbuilder
    ```
3. postgresqlのセットアップをする。
   - macOS上での設定
      ```
      ユーザーとデータベースの作成
      % createuser -P {ユーザー}
      % createdb {データベース} -O {ユーザー}

      確認
      % psql -l
      ```
4. Railsのマイグレーションをする。
   - 例：バス停アプリ
    ```
    % bundle exec rails generate scaffold BusLine name:text
    % bundle exec rails generate scaffold BusSchedule departure_hour:bigint departure_minute:bigint bus_line_id:bigint
    % bundle exec rails db:migrate
    ```
5. 起動確認をする。
    ```
    % bundle exec rails server -b 0.0.0.0
    ```
## Hotwireの機能確認

Rails7のHotwire実装について記述する。

### TurboDrive

Rails7では、Scaffoldなどでモデルとコントローラーを作成すると、Turbo Driveが実装された状態になる。

- Turbo Driveは、ページレベルのナビゲーションを強化する。
- リンクのクリック、フォームの送信を監視し、バックグラウンドで実行（XHRで通信）し、完全なリロードを行わずにページを更新する。
- 以前、Turbolinksとして知られていたライブラリの進化版である。

### TurboFrame

Turbo Framesは、``<turbo-frame>``要素（またはコード``turbo_frame_tag``）で定義した部分を、リクエストに応じて更新する。

- src属性が指定されている場合、ページの読み込み完了時に、自動的にそのパスにリクエストが送信され、応答データで自動更新される。
- ``target="_top"``でページ全体を更新する。
- ``data-turbo-frame``、``data-turbo-action``などで対象とアクションを調整する。

#### 実装例：バス停アプリ

- スケジュール一覧のパーツを作成する。
  - routeへのリソース追加
  - modelへのスコープ追加
  - viewへpartialファイル追加と一覧ページでの読み込み変更
  - pertialのコントローラー追加

### TurboStream

Turbo Streamsは、<turbo-stream>要素でラップされた部分をサーバプッシュにより更新する。

- ストリーム要素は、その中のHTMLに何が起こるかを宣言するために、ターゲットIDとともにアクションを指定する。
  - ``<turbo-stream action="xxx" targets="xxx">``、または``turbo_stream_from``、``turbo_stream.append``などでアクションやターゲット、データを指定する。
- WebSocket、SSE、または他のトランスポートを介してサーバーからプッシュされ、他のユーザーまたはプロセスによって行われた更新を反映する。
- （受信トレイの新規受信メールなど）

#### 実装例：バス停アプリ

- viewへ``turbo_stream_from``でコネクション対象と、``<turbo-stream>``要素（または``turbo_stream.append``など）を追記
- modelへActionCable(Websocket)の処理を追記
  - ``after_create_commit -> { broadcast_append_to xxx }``など


### Stimulus

Stimulusは、記述されたHTML上に単純な属性を付与することで機能を拡張する仕組みである。

- ``data-controller``属性を持つページを監視し、属性に対応するコントローラクラスをインスタンス化し、機能を追加する。
- つまり、class属性がHTMLをCSSに接続するブリッジであるのと同様に、``data-controller``属性はHTMLをJavaScriptに接続するブリッジとなる。

#### 実装例：バス停アプリ

- viewへ``data-controller="schedule"``、及び操作対象に``data-schedule-target="row" data-action="click->schedule#selectRow"``を追加
- 機能拡張するjavascriptを記述
