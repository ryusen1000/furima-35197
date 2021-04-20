# テーブル設計

## USERSテーブル

| Column             | Type       | Options                   |
|--------------------|------------|---------------------------|
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| first_name         | string     | null: false               |
| family_name        | string     | null: false               |
| first_name_kana    | string     | null: false               |
| family_name_kana   | string     | null: false               |
| birth              | date       | null: false               |

### Association
- has_many :items
- has_many :purchases

## ITEMSテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| item_name       | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| item_status_id  | integer    | null: false                    |
| ship_cost_id    | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| days_to_ship_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## PURCHASESテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_one :shipping
- belongs_to :user
- belongs_to :item

## SHIPPINGSテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_num    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| tel_num       | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
