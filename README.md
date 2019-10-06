# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture_id|integer|null:false, foreign_key: true|

### Association

- belongs_to :prefecture
- has_many :items
- has_many :comments


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|prefecture_id|integer|null:false, foreign_key: true|
|first_category_id|integer|null:false, foreign_key: true|
|second_category_id|integer|null:false, foreign_key: true|
|third_category_id|integer|null:false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :prefecture
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category
- has_many :comments


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null:false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item


## prefectureテーブル

|Column|Type|Options|
|------|----|-------|

### Association
- has_many :users
- has_many :items


## first_categoryテーブル

|Column|Type|Options|
|------|----|-------|

### Association

- has_many :items
- has_many :second_categories

## second_categoryテーブル

|Column|Type|Options|
|------|----|-------|
|first_category_id|integer|null:false, foreign_key: true|

### Association
- has_many :items
- has_many :third_categories
- belongs_to :first_category
