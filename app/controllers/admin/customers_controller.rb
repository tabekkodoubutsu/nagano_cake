class Admin::CustomersController < ApplicationController
  def index
    #@users = User.page(params[:page]).reverse_order
    @customers= Customer.all
  end 
  
  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end 
  
  def edit
    @customer = Customer.find(params[:id])
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
  
end
