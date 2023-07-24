Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users
  resources :tweets do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:index, :new]
end
