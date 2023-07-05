Rails.application.routes.draw do
    
  get 'menu_items/index'
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :customer do
    post '/customers/sign_up', to: 'public/registrations#create', as: 'custom_registration'
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end

  root to: "public/homes#top"
  get '/about' => 'public/homes#about'
  
  scope module: 'customers' do
    resources :cats, only: [:show, :index]
    resources :menu_items, only: [:index]
  end
  
  namespace :public do
    get '/my_page', to: 'customers#show', as: 'my_page'#マイページ
    get 'customers/edit' => 'customers#edit'
    patch 'update' => 'customers#update'#会員情報編集画面
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'#退会機能
    get 'quit' => 'customers#quit'#退会画面
    resources :cats, only: [:index, :show]#所属猫一覧画面、所属猫詳細画面
    resources :menu_items, only: [:index]#カフェメニュー一覧
    get '/reservations/new' => 'reservations#new', as: 'new_reservation'#予約情報入力画面
    post '/reservations' => 'reservations#create', as: 'reservations'
    get 'reservations/thanks' => 'reservations#thanks', as: 'thanks_reservation'#サンクス画面
    get 'my_page/reservations' => 'reservations#index', as: 'my_page_reservations'#予約情報入力画面
    resources :reservations, only: [:show]#予約情報確認画面
  end
  
  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end
   
  namespace :admin do
    root :to => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update, :destroy]#会員画面
    resources :cats, only: [:show, :index, :new, :create, :edit, :update, :destroy]#所属猫画面
    resources :menu_items, only: [:index, :new, :create, :edit, :update, :destroy]#カフェメニュー画面
    resources :reservations, only: [:index, :show]#予約一覧画面、予約詳細画面
    delete 'cats'=> 'cats#destroy'
    delete 'customers'=> 'customers#destroy'
    delete 'menu_items'=> 'menu_items#destroy'
  end
end
