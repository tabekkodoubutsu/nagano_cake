class Item < ApplicationRecord
  has_many :cart_items
  attachment :image
end
