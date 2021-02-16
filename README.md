# テーブル設計

## usersテーブル

| Column             | Type   | Options              |
| ------------------ | ------ | -------------------- |
| nickname           | string | NOT NULL             |
| email              | string | NOT NULL unique: true|
| encrypted_password | string | NOT NULL             |
| first_name         | string | NOT NULL             |
| last_name          | string | NOT NULL             |
| first_name_kana    | string | NOT NULL             |
| last_name_kana     | string | NOT NULL             |
| birth              | date   | NOT NULL             |

### Association
has_many :items
has_many :orders

## itemsテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | NOT NULL          |
| description    | text       | NOT NULL          |
| category_id    | integer    | NOT NULL          |
| condition_id   | integer    | NOT NULL          |
| delivery_id    | integer    | NOT NULL          |
| prefectures_id | integer    | NOT NULL          |
| days_id        | integer    | NOT NULL          |
| price          | integer    | NOT NULL          |
| user           | references | foreign_key: true |

### Association
has_oue :order
belongs_to :user


## ordersテーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| post_code         | string     | NOT NULL          |
| prefectures_id    | integer    | NOT NULL          |
| city              | string     | NOT NULL          |
| address           | string     | NOT NULL          |
| building_name     | string     |                   |
| phone_number      | string     | NOT NULL          |
| user              | references | foreign_key: true |

### Association
has_oue :destination


## destinationテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :order