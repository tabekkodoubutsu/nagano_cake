class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
    end



    private
    def order_params
      params.require(:order).permit(:pyament_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
    end

end
