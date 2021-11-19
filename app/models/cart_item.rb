class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end

end
