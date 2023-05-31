Rails.application.routes.draw do
    
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :customer do
    post '/customers/sign_up', to: 'public/registrations#create', as: 'custom_registration'
  end

  root to: "public/homes#top"
  get '/about' => 'public/homes#about'
  
  scope module: 'customers' do
    resources :items, only: [:show, :index]
   end
  
  namespace :public do
  end
  
  
  
  
   # 管理者用
   devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
   
   namespace :admin do
    root :to => 'admin/homes#top'
    # resources :customers, only: [:index, :show, :edit, :update]
    # resources :items, only: [:show, :index, :new, :create, :edit, :update, :destroy]
    # resources :orders, only: [:index, :show, :update]
    # resources :order_items, only: [:update]
    # delete 'items'=> 'items#destroy'
  end
end
