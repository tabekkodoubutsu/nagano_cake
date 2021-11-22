class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def subtotal
    item.with_tax_price * amount
  end

  private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end

end
