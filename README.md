# テーブル設計

## USERSテーブル

| Column           | Type       | Options                   |
|------------------|------------|---------------------------|
| nickname         | string     | null: false               |
| email            | string     | null: false, unique: true |
| password         | string     | null: false               |
| first_name       | string     | null: false               |
| family_name      | string     | null: false               |
| first_name_kana  | string     | null: false               |
| family_name_kana | string     | null: false               |
| birth            | integer    | null: false               |

### Association
- have_many :items
- have_many :purchases

## itemsテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| item_name    | string     | null: false                    |
| text         | string     | null: false                    |
| category     | string     | null: false                    |
| item_status  | string     | null: false                    |
| ship_source  | string     | null: false                    |
| days_to_ship | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| purchase     | references | null: false, foreign_key: true |
| shipping     | references | null: false, foreign_key: true |

### Association
- has_one :purchases
- has_one :shippings
- belongs_to :users

## purchasesテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| shipping     | references | null: false, foreign_key: true |

### Association
- has_one :shipping
- belongs_to :users
- belongs_to :items

## shippingsテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| postal_num   | integer    | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | text       |                                |
| tel_num      | integer    | null: false                    |
| purchases    | references | null: false, foreign_key: true |

### Association
- belongs_to :purchases
