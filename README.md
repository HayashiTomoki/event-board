# Event Board 仕様書
##　現状
* 現在イベントの出席管理には紙を用いている
* 紙が紛失してしまうことがる
* 参加不参加の変更が手軽にできない
* 意見を聞きたい場合なども大変
* イベント参加者への連絡にメールを使っているが仕事のメールに混ざり見落とされやすい

## 要件
* Webでイベントの出席管理を行えるようにする
* 参加未参加の変更を手軽に行えるようにする
* イベントについてのコメントをできるようにする
* メール以外での連絡方法 

## 実装機能
* イベント作成機能
* イベント一覧機能
* イベント詳細表示機能(参加者一覧・参加人数・主催者情報など)
* イベントへの参加機能
* イベントへの不参加・キャンセル機能
* Slackでの通知機能

## DB構成
### Events
|カラム名 |型      |その他|
|:-------:|:------:|:---------:|
|id       |INTEGER |PRIMARY KEY|
|title    |varchar ||
|date     |varvhar ||
|deadline |datetime||
|create_at|datetime||
|update_at|datetime||

### Participants
|カラム名 |型      |その他|
|:-------:|:------:|:---------:|
|id       |INTEGER |PRIMARY KEY|
|event_id |INTEGER ||
|user_id  |INTEGER ||
|status   |enum    ||
|create_at|datetime||
|update_at|datetime||
