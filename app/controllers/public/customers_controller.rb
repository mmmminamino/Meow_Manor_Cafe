class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def new
      
    end
    
    def show
      @customer=current_customer
    end
    
    def edit
      @customer=current_customer
    end
    
    def update
      @customer=current_customer
      if @customer.update(customer_params)
        flash[:success] ="登録情報を変更しました"
        redirect_to public_my_page_path
      else
        render:edit
      end
    end
    
    private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :birthday, :is_deleted)
    end
end