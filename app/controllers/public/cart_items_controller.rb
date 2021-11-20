class Public::CartItemsController < ApplicationController

  def create
  end

  def index
    @cart_items = current_customer.cart_items.all
    # カートに入っている商品の合計金額
    @total_payment = 0
  end

  def update
  end

  def destoroy
  end

  def destroy_all
  end

end
