class Product < ApplicationRecord
  validates :title
  validates :description 
  validates :price
  validates :weight
end