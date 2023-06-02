class Public::CatsController < ApplicationController
    before_action :authenticate_customer!, only: [:create,:index, :show, :new]
    
    def index
        @cats_all = Cat.all
    end
    
    def show
        @cat=Cat.find(params[:id])
    end
    
    private
    
    def cat_params
        params.require(:cat).permit(:name, :introduction, :price, :image, :is_active)  
    end
end