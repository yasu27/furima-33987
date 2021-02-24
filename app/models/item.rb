class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :day
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price,        numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end 

  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :delivery_id  
    validates :prefecture_id
    validates :day_id
  end
  #1 models/item.rb ,user.rbにアソシエーションを書く（READMEを参考にしてください）
  #2 show.html.erbに@item.ゆーざー.取り出したいカラム名
end
