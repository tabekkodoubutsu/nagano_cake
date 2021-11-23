class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
    end

    def confirm
        @order = Order.new(order_params)
        if params[:order][:select_address] == "0"
            @order.postal_code = current_customer.postal_code
            @order.address = current_customer.address
            @order.name = current_customer.last_name + current_customer.first_name
            
        elsif params[:order][:select_address] == "1"
            @address = Address.find(params[:order][:address_id])
            @order.postal_code = @address.postal_code
            @order.address = @address.address
            @order.name = @address.name
        
        elsif params[:order][:select_address] == "2"
            address_new = current_customer.address.new(address_params)
            if address_new.save
            else
              render :new
            end
        end
        @cart_items = current_customer.cart_items.all
        @total = 0
        @total_payment = SHIPPING_COST + @total
    end    

    private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
    end

end