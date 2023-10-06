Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :create, :destroy, :edit]

  resources :users, only: [:show]

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
end