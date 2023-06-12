class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
    
    def index #会員一覧
      @search=Customer.ransack(params[:q])
      @customers=@search.result.page(params[:page])
    end
    
    def show
      @customer=Customer.find(params[:id])
    end
    
    def edit
      @customer=Customer.find(params[:id])
    end
    
    def update
      @customer=Customer.find(params[:id])
      if @customer.update(customer_params)
        flash[:notice_update] ="会員情報を更新しました"
        redirect_to admin_customer_path(@customer)
      else
        render edit_admin_customer_path(@customer)
      end
    end
    
  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :email, :is_deleted)
    end
end