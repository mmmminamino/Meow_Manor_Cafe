class Admin::MenuItemsController < ApplicationController
    before_action :authenticate_admin!, only: [:create,:edit,:update,:index, :new]
    
    def index
        @menu_items=MenuItem.all
    end
    
    def new
        @menu_items=MenuItem.new
    end
    
    def create
        @menu_item=MenuItem.new(params[:id])
        if @menu_item.save!
            redirect_to admin_menu_items_path(@menu_item)
        else
            redirect_to new_admin_menu_item_path
        end
    end
    
    def edit
        @menu_item=MenuItem.find(params[:id])
    end
    
    def update
        @menu_item=MenuItem.find(params[:id])
        if @menu_item.update(menu_item_params)
            redirect_to admin_menu_items_path(@menu_item)
            flash[:notice_update]="猫の情報を更新しました"
        else
            redirect_to edit_admin_menu_item_path(@menu_item)
        end
    end
    
    def destroy
        @menu_item=MenuItem.find(params[:id])
        @menu_item.destroy
        flash.now[:alert]="#{@menu_item.name}を削除しました"
        redirect_to admin_menu_items_path
    end
    
    private
    def menu_item_params
        params.require(:menu_item).permit(:name, :price_without_tax)  
    end
end
