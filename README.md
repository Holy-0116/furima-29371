# テーブル設計

## Users  テーブル

| Column              | Type      | Options                     |
| ------------------- | --------- | --------------------------- |
| nickname            | string    | null: false                 |
| email               | string    | null: false                 |
| password            | string    | null: false                 |
| name_first          | string    | null: false                 |
| name_family         | string    | null: false                 |
| name_first_reading  | string    | null: false                 |
| name_family_reading | string    | null: false                 |
| birthday            | date      | null: false                 |

### Association

- has_many :items
- has_many :orders



## Addresses  テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| order           | references | null: false, foreign_key: true  |
| postal_code     | string     | null: false                     |
| prefecture      | integer    | null: false                     |
| city            | string     | null: false                     |
| house_number    | stribg     | null: false                     |
| building_name   | string     | null: false                     |
| tell            | string     | null: false                     |

### Association

- belongs_to :order


## Items  テーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| user              | references | null: false, foreign_key: true  |
| name              | string     | null: false                     |
| explanation       | text       | null: false                     |
| price             | integer    | null: false                     |
| category_id       | integer    | null: false, foreign_key: true  |
| status_id         | integer    | null: false, foreign_key: true  |
| delivery_fee_id   | integer    | null: false                     |
| delivery_day_id   | integer    | null: false                     |
| shipping_origin_id| integer    | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one    :order


## Orders  テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| item            | references | null: false, foreign_key: true  |

### Association

- belongs_to  :user
- belongs_to  :item
- has_one     :address