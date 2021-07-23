## usersテーブル（ユーザー情報）
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |
### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル（商品詳細）
| Column                | Type     | Options     |
| ------------------    | -------- | ----------- |
| name                  | string   | null: false |
| info                  | text     | null: false |
| category_id           | string   | null: false |
| sales_status_id       | string   | null: false |
| shipping_fee_status_id| string   | null: false |
| prefecture_id         | string   | null: false |
| scheduled_delivery_id | string   | null: false |
| price                 | integer  | null: false |
| user                  |references| null: false,foreign_key:true|
### Association
- belongs_to :user
- has_one    :purchase_record


## destinationsテーブル（発送先）
| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| postal_code_id     | string   | null: false |
| prefectures_id     | integer  | null: false |
| municipalities     | string   | null: false |
| address            | string   | null: false |
| building_name      | string   |             |
| telephone_number   | string   | null: false |
| purchase_record    |references| null: false, foreign_key:true|
### Association
- belongs_to : purchase_record

## purchase_recordsテーブル(商品、購入者)
| Column          | Type     | Options                       |
| ----------------| -------- | ----------------------------- |
| item            |references| null: false, foreign_key:true |
| user            |references| null: false, foreign_key:true |
### Association
- belongs_to : user
- belongs_to : items
- has_one    :destinations