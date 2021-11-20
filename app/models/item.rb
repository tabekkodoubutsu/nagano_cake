class Item < ApplicationRecord
  has_many :cart_items
  attachment :image
  
  def with_tax_price
    (price * 1.1).floor
  end
  # 消費税を求めるメソッド
 
end
