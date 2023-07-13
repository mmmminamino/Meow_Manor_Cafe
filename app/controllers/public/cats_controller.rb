class Public::CatsController < ApplicationController
    
    def index
        @search=Cat.ransack(params[:q])
        @cats=@search.result.page(params[:page]).per(10)
        @cats_all= Cat.all
    end
    
    def show
        @cat=Cat.find(params[:id])
    end
    
    private
    
    def cat_params
        params.require(:cat).permit(:name, :introduction, :image, :is_active, :genders, :age, :cat_type)  
    end
end