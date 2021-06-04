Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'recipes#homepage' 

  get 'users/favorites'
  get 'users/myrecipes'
  get 'recipes/results'

  get '/adm', to: 'admins#index', :as => :admin_view
  get '/adm/ban/:id', to: 'admins#ban_user', :via => :get, :as => :admin_ban_user
  get '/adm/unban/:id', to: 'admins#unban_user', :via => :get, :as => :admin_unban_user
  get '/adm/admin/:id', to: 'admins#admin_user', :via => :get, :as => :admin_admin_user
  get '/adm/unadmin/:id', to: 'admins#unadmin_user', :via => :get, :as => :admin_unadmin_user
  
  resources :recipes do
    put :favorite, on: :member
    resources :reviews
  end
end
