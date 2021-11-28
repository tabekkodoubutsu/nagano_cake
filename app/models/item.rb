class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  attachment :image
  belongs_to :genre 
  
  def with_tax_price
    (price * 1.1).floor
  end
  # 消費税を求めるメソッド
end