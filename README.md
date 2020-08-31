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
- has_one  :address

## Address  テーブル

| Column          | Type       | Options                         |
| --------------- | -----------| ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| postal_code     | string     | null: false                     |
| prefecture      | string     | null: false                     |
| city            | string     | null: false                     |
| house_number    | stribg     | null: false                     |
| building_name   | string     | null: false                     |
| tell            | string     | null: false                     |

### Association

- belongs_to :user


## Item  テーブル

| Column          | Type       | Options                         |
| --------------- | -----------| ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| name            | string     | null: false                     |
| explanation     | text       | null: false                     |
| price           | integer    | null: false                     |
| category        | string     | null: false, foreign_key: true  |
| status          | string     | null: false, foreign_key: true  |
| delivery_fee    | integer    | null: false                     |
| delivery_day    | integer    | null: false                     |
| sold check      | boolean    |                                 |
| shipping_origin | string     | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one   :order


## Order  テーブル

| Column          | Type       | Options                         |
| --------------- | -----------| ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| item            | references | null: false, foreign_key: true  |

### Association

- belongs_to  :user
- belongs_to :item