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
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|tel|string|null: false|
|postal_code|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string||
|tel2|string||
|credit_card|string|null: false|
|profile|text||

### Association

- belongs_to :prefecture
- has_many :items
- has_many :comments


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|explanation|text|null: false|
|status|string|null: false|
|size|string||
|brand|string||
|shipping_charge|string|null: false|
|days_before_shipment|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :prefecture
- belongs_to :category
- has_many :comments


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text||
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item


## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|

### Association
- has_many :users
- has_many :items


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|null: false, foreign_key: true|

### Association

- has_many :items
- belongs_to :parent
- has_many :children