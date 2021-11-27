# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :customer_state, only: [:create]  
    # before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # # end
  # protected
  # # https://qiita.com/yuto_1014/items/358d0a425193b12c969a
  # def reject_user
  #   @user = Customer.find_by(email: parms[:customer][:email])
  #   if @user
  #     if (@user.valid_password?(params[:customer][:password]) && (@user.active_for_authentication? == false))
  #       flash[:error] = "退会済みです。"
  #       redirect_to new_customer_registration_path
  #     end
   
  #   end
  # end
# # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: parms[:customer][:email])
  
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
  
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
    ## 【処理内容3】
    redirect_to new_customer_registration_path
    end
  end
end
