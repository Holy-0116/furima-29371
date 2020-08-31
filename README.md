# テーブル設計

##　Users  テーブル

| Column          | Type      | Options      |
| --------------- | --------- | ------------ |
| nickname        | string    | null: false  |
| email           | string    | null: false  |
| password        | string    | null: false  |
| name            | string    | null: false  |
| name_reading    | string    | null: false  |
| birthday        | date      | null: false  |

### Association

- has_many :items
- has_many :orders


## Addresses  テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| postal_code     | string     | null: false                     |
| prefecture      | integer    | null: false                     |
| city            | string     | null: false                     |
| house_number    | stribg     | null: false                     |
| building_name   | string     | null: false                     |
| tell            | string     | null: false                     |

### Association

- belongs_to :order

## Items  テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| name            | string     | null: false                     |
| explanation     | text       | null: false                     |
| price           | integer    | null: false                     |
| category        | integer    | null: false, foreign_key: true  |
| status          | integer    | null: false, foreign_key: true  |
| delivery_fee    | integer    | null: false                     |
| delivery_day    | integer    | null: false                     |
| shipping_origin | integer    | null: false, foreign_key: true  |

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