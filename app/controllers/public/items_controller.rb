class Public::ItemsController < ApplicationController

    def show
      @cart_item = CartItem.new
      @item = Item.find(params[:id])
    end
end