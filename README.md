# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |


### Association

- has_many :prototype
- has_many :prototype through: comments
- has_many :comments

## prototype テーブル

| Column      | Type       | Options     |
| ------      | ------     | ----------- |
| title       | string     | null: false |
| catch_copy  | text       | null: false |
| concept     | text       | null: false |
| image       |
| user        | references |

### Association

- has_many :comments
- has_many :user through: comments
- has_many :user


## comments テーブル

| Column    | Type        Options                        
| ------    | ---------- | ------------------------------ 
| text      | text       | null: false
| user      | references | null: false, foreign_key: true 
| prototype | references | null: false, foreign_key: true 

### Association

- has_many :prototype
- has_many :user