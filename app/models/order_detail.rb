class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { not_startable: 0, waiting_production: 1, production: 2, complete_production: 3 }

  
  def subtotal
    item.with_tax_price * amount
  end

end
