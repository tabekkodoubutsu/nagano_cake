class Public::CartItemsController < ApplicationController

  def create
    @item = CartItem.new(cart_item_params)
    @item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    # 1. 追加した商品がカート内に存在するかの判別
      current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    # 存在した場合
        # 2. カート内の個数をフォームから送られた個数分追加する .to_iとして数字として扱う
    else
      @item.save
      redirect_to cart_items_path
    end
    # 存在しなかった場合  カートモデルにレコードを新規作成する
  end

  def index
    @cart_items = current_customer.cart_items.all
    # カートに入っている商品の合計金額
    @total_payment = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
