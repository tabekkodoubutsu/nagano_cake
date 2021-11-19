class Admin::ItemsController < ApplicationController

 
 def new
    @item=Item.new
    
 end
 
  def create
    @item = Item.new(item_params)
    # if
        @item.save
       redirect_to admin_item_path(@item)
    # else
    #   redirect_to request.referer,notice:"新規登録できませんでした"
    # end 
  end
  def edit
  end
  def update
  end
  def index 
  end
  def show
  end
  
  private
    def item_params
      params.require(:item).permit( :name, :image_id, :introduction, :price, :is_active)
    # :genre_id,ジャンル追加後に上記へ追加
    end
end
