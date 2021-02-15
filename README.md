# テーブル設計

## usersテーブル

| Column          | Type   | Options  |
| --------------- | ------ | -------- |
| nickname        | string | NOT NULL |
| email           | string | NOT NULL |
| password        | string | NOT NULL |
| first_name      | string | NOT NULL |
| last_name       | string | NOT NULL |
| first_name_kana | string | NOT NULL |
| last_name_kana  | string | NOT NULL |
| birth_year      | date   | NOT NULL |
| birth_month     | date   | NOT NULL |
| birth_day       | date   | NOT NULL |


## itemsテーブル

| Column      | Type       | Options  |
| ----------- | ---------- | -------- |
| image       |            | NOT NULL |
| name        | string     | NOT NULL |
| description | text       | NOT NULL |
| category    | string     | NOT NULL |
| condition   | string     | NOT NULL |
| delivery    | string     | NOT NULL |
| area        | string     | NOT NULL |
| days        | string     | NOT NULL |
| price       | string     | NOT NULL |
| user        | references |          |


## purchasesテーブル

| Column            | Type       | Options  |
| ----------------- | ---------- | -------- |
| card              | text       | NOT NULL |
| expiration_date   | references | NOT NULL |
| security_code     | references | NOT NULL |
| post_code         | text       | NOT NULL |
| prefectures       | references | NOT NULL |
| city              | references | NOT NULL |
| address           | text       | NOT NULL |
| building_name     | references |          |
| phone_number      | references | NOT NULL |
| user              | references |          |
