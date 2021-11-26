class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
   
  end 
  
  def edit
    @customer = Customer.find(params[:id])
  end 
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to customers_my_page_path(@customer.id)
    else
      render :edit
    end
  end 
  
   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted )
  end
end
