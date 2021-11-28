class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:notice] = 'You have updated order_detail successfully.'
      redirect_to admin_root_path
    else
      render :orders.show
    end
  end 
  
  
  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
