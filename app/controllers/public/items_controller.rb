class Public::ItemsController < ApplicationController

    def index
        @items=Item.all
        @genres=Genre.all
    end

    def show
      @cart_item = CartItem.new
      @item = Item.find(params[:id])
      @genres=Genre.all
    end
end