class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
    end

    def confirm
        @order = Order.new(order_params)
        @order.shipping_cost = 800
        @cart_items = current_customer.cart_items.all
        @total = 0

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
    end

    def create
        cart_items = current_customer.cart_items.all
        @order = current_customer.orders.new(order_params)
        if @order.save
          cart_items.each do |cart_item|
              order_detail = OrderDetail.new
              order_detail.item_id = cart_item.item_id
              order_detail.order_id = @order.id
              order_detail.amount = cart_item.amount
              order_detail.price = cart_item.item.price
              order_detail.save
          end
          current_customer.cart_items.destroy_all
          redirect_to orders_thanks_path
        else
            render :new
        end
    end

    def thanks
    end

    private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
    end

end