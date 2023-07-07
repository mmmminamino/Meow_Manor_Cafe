class Public::MenuItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:index]
  
  
  def index
    @menu_items=MenuItem.all
  end
  
  private
    def menu_item_params
        params.require(:menu_item).permit(:name, :price_without_tax)  
    end
end
