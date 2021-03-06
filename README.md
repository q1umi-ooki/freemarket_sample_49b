# Table

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|introduction|text||
|money|integer|default: 0|
|eva_good|integer|default: 0|
|eva_normal|integer|default: 0|
|eva_but|integer|default: 0|
||||
|user_id|references||

- has_many :products
- has_many :comments
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|

- has_one :profile, dependent: :nullify

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|profile_id|references||
|product_id|references||

- belongs_to :profile
- belongs_to :product


## products
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false,default: 0|
|statu2s|string|null:false|
|delivery_fee|integer|null:false|
|delivery_time|integer|null:false|
|prefecture_id|integer|foreign_key:true|
|detail|text|null:false|
|brand_id|references||
|profile_id|references||
|parent_category_id|references||
|category_id|references||
|child_category_id|references||
- belongs_to :brand
- belongs_to :profile
- belongs_to :category_parents
- belongs_to :category
- belongs_to :category_child
- has_many :comments
- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
- has_many :products
- has_many :category_children

## category_parents
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
- has_many :categories
- has_many :products

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_parents_id|references||
- belongs_to :category_parent
- has_many :category_children
- has_many :products

## category_children
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_id|references||
|brand_id|references||
- belongs_to :category
- belongs_to :brand
- has_many :products
