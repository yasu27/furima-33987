class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :day
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description 
    validates :category_id,   numericality: { other_than: 1 } 
    validates :condition_id,  numericality: { other_than: 1 } 
    validates :delivery_id,   numericality: { other_than: 1 }   
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :day_id,        numericality: { other_than: 1 }
    validates :price,         numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
