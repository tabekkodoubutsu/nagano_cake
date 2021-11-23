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
    @item = Item.find(params[:id])
  end
  
  def update
  end
  def index 
    @items=Item.all
  end
  def show
    @item = Item.find(params[:id])
  end
  
  private
    def item_params
      params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
    end
end
