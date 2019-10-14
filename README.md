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
|phone_number|string|null: false|
|postcode|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone_number_sub|string||
|profile|text||
|point|integer|null: false|

### Association

- belongs_to :prefecture
- has_many :items
- has_many :comments
- has_many :credits
- has_many :evaluations
- has_many :items, through: :likes



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|status|string|null: false|
|size|string||
|shipping_charge|string|null: false|
|days_before_shipment|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :prefecture
- belongs_to :category
- has_many :comments
- has_many :photos
- belongs_to :brand
- has_many :users, through: :likes



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
|name|string|null: false|

### Association
- has_many :users
- has_many :items



## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index?|

### Association

- has_many :items
- has_ancestry



## photosテーブル

|Column|Type|Options|
|------|----|-------|
|photo|text|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item



## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :items



## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|number|string|null: false|
|month|string|null: false|
|year|string|null: false|
|security_code|string|null: false|
|user_id|integer|null: false, foreign_key|

### Association

- belongs_to :user



## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user



## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user