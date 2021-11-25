class Admin::OrdersController < ApplicationController
  
  def show
    @order= Order.find(params[:id])
    @order_detail= OrderDetail.find(params[:id])
    #@customer = Customer.find(params[:id])
    #@orders = @customer.orders
  end 
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end 
  
  
  private

  def order_detail_params
    params.require(:order_detail).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted )
  end
  def order_params
    params.require(:order_detail).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted )
  end
  
end
