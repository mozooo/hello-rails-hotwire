# Hello Rails Hotwire

## 概要

Rails7、Hotwireを使ったサンプル。

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
