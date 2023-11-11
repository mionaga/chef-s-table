Rails.application.routes.draw do
 # 顧客用
 # URL /customers/sign_in ...
 devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/end_users/registrations",
    sessions: 'public/sessions'
  }
  
 # ゲストログイン用
 devise_scope :end_user do
  post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
 end

 # 管理者用
 # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  root to: 'public/homes#top'
   get 'homes/about' => "public/homes#about", as: :about
   
  
  namespace :admin do
    get 'homes/top' => 'homes#top'
    
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :ingredients
    resources :categories, only: [:index, :create, :edit, :update, :destroy]

  end
  
  
  scope module: :public do
    get 'end_users/:id/reregistration', to: 'end_users#reregistration', as: 'reregistration'
     # 退会確認画面
    get  '/end_users/:id/check' => 'end_users#check', as: 'check'
     # 論理削除用のルーティング
    patch '/end_users/:id/withdraw' => 'end_users#withdraw', as: 'withdraw'
    
    # devise_scope :user do
      # post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    # end
    
    get 'recipes/tag/:name', to: "recipes#tag_search"
    get 'recipes/search', to: 'recipes#search'
    
    resources :end_users
    resources :ingredients, only: [:index, :show]
    resources :recipes   
    
    
  end
  
end
