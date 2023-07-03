# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create, :top, :about]
  
  def new
    @admin=Admin.new
  end

  def create
    admin = Admin.find_by(email: params[:admin][:email].downcase)
      #binding.pry
    if admin && admin.valid_password?(params[:admin][:password])
      sign_in admin
      redirect_to admin_root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
    
  def destroy
    reset_session
    redirect_to new_admin_session_path
  end
      
  protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
         devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute,:encrypted_password])
    end
end