class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def new
      
    end
    
    
    private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :birthday, :is_deleted)
    end
end