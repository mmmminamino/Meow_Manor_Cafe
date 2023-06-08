class Admin::CatsController < ApplicationController
    before_action :authenticate_admin!, only: [:create,:edit,:update,:index, :show, :new]
    
    def show
        @cat=Cat.find(params[:id])
    end
    
    def index
        @cats=Cat.all
    end
    
    def new
        @cats=Cat.new
    end
    
    def create
        @cat=Cat.new(cat_params)
        if @cat.save!
            redirect_to admin_cat_path(@cat)
        else
            redirect_to new_admin_cat_path
        end
    end
    
    def edit
        @cat=Cat.find(params[:id])
    end
    
    def update
        @cat=Cat.find(params[:id])
        if @cat.update(cat_params)
            redirect_to admin_cats_path(@cat)
            flash[:notice_update]="猫の情報を更新しました"
        else
            redirect_to edit_admin_cats_path(@cat)
        end
    end
    
    def destroy
        @cat=Cat.find(params[:id])
        @cat.destroy
        flash.now[:alert]="#{@cat.name}を削除しました"
        redirect_to admin_cats_path
    end
    
    private
    def cat_params
        params.require(:cat).permit(:name, :introduction, :genders, :image, :age, :cat_type)  
    end
end