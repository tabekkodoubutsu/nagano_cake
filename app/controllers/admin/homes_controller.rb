class Admin::HomesController < ApplicationController
  def top
    @order_details= OrderDetail.page(params[:page]).reverse_order
  end
  
end
