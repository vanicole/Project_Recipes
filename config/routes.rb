Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'recipes#homepage' 

  get 'users/favorites'
  get 'users/myrecipes'
  get 'recipes/results'

  resources :recipes do
    put :favorite, on: :member
    resources :reviews
  end
end
