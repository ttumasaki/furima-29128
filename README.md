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

| Column             | type    | option      |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | strinag | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name         | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- belongs_to :order


## items テーブル

| Column       | type       | option            |
| ------------ | ---------- | ----------------- |
| items_name   | string     | null: false       |
| explanation  | text       | null: false       |
| category     | string     | null: false       |
| status       | integer    | null: false       |
| fee_burden   | integer    | null: false       |
| source_area  | integer    | null: false       |
| day_required | integer    | null: false       |
| price        | integer    | null: false       |
| user_id      | references | foreign_key: true |

### Association
- belongs_to :user


##  orders テーブル

| Column  | type       | option            |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association
- has_many :users
- has_one :address

## addresses テーブル

| Column        | type       | option            |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture    | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     |                   |
| phone_number  | string     | null: false       |
| order_id      | references | foreign_key: true |

### Association
- belongs_to :order