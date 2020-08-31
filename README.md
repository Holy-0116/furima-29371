# テーブル設計

##　Users  テーブル

| Column          | Type      | Options      |
| --------------- | --------- | ------------ |
| nickname        | string    | null: false  |
| email           | string    | null: false  |
| password        | string    | null: false  |
| name            | string    | null: false  |
| birthday        | integer   | null: false  |

### Association

- has_meny :items
- has_many :orders

## Item  テーブル

| Column          | Type       | Options                         |
| --------------- | -----------| ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| name            | string     | null: false                     |
| explanation     | string     | null: false                     |
| price           | integer    | null: false                     |
| category        | string     | null: false, foreign_key: true  |
| status          | string     | null: false, foreign_key: true  |
| delivery fee    | integer    | null: false                     |
| delivery day    | integer    | null: false                     |
| sold check      | boolean    |                                 |
| shipping origin | string     | null: false, foreign_key: true  |

### Association

- belogs_to :user
- has_one   :order


## Order  テーブル

| Column          | Type       | Options                         |
| --------------- | -----------| ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| item            | references | null: false, foreign_key: true  |
| price           | references | null: false, foreign_key: true  |

### Association

- belogs_to  :user
- belongs_to :item