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
- have_many :items
- have_many :purchases

## itemsテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| item_name    | string     | null: false                    |
| text         | text       | null: false                    |
| category     | integer    | null: false                    |
| item_status  | integer    | null: false                    |
| ship_cost    | integer    | null: false                    |
| ship_source  | integer    | null: false                    |
| days_to_ship | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchasesテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- has_one :shipping
- belongs_to :user
- belongs_to :item

## shippingsテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| postal_num   | string     | null: false                    |
| prefectures  | integer    | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | text       |                                |
| tel_num      | string     | null: false                    |
| purchases    | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
