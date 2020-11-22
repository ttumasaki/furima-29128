# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column     | type    | option      |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | strinag | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| birthday   | date    | null: false |

### Association
- has_many :items
- has_many :comments
- has_one :adress


## items テーブル

| Column       | type    | option                         |
| ------------ | ------- | ------------------------------ |
| image        | string  | null: false                    |
| items_name   | string  | null: false                    |
| explanation  | text    | null: false                    |
| category     | string  | null: false                    |
| status       | string  | null: false                    |
| fee_burden   | string  | null: false                    |
| source_area  | string  | null: false                    |
| day_required | string  | null: false                    |
| price        | integer | null: false                    |
| user_id      | integer | null: false, foreign_key: true |

### Association
- has_many :items_comments
- has_many :comments, through:items_comments
- belongs_to :users


## comments テーブル

| Column  | type    | option      |
| ------- | ------- | ----------- |
| message | text    | null: false |
| user_id | integer | null: false |
| item_id | integer | null: false |

### Association
- has_many :items_comments
- has_many :items,thtough:items_comments
- belongs_to :users


## users_comments テーブル
| Column      | type    | option      |
| ----------- | ------- | ----------- |
| user_id     | integer | null: false |
| comments_id | integer | null: false |

### Association
- belongs_to :users
- belongs_to :comments

## items_comments テーブル

| Column      | type    | option                         |
| ----------- | ------- | ------------------------------ |
| items_id    | integer | null: false, foreign_key: true |
| comments_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :comments


## address テーブル

| Column        | type    | option                         |
| ------------- | ------- | ------------------------------ |
| postal_code   | integer | null: false                    |
| prefecture    | string  | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  | null: false                    |
| phone_number  | integer | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association
- belongs_to :users