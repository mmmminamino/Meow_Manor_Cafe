class Public::MenuItemsController < ApplicationController
  
  
  def index
    @menu_items=MenuItem.all
  end
  
  private
    def menu_item_params
        params.require(:menu_item).permit(:name, :price_without_tax)  
    end
end
