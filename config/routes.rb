Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]  # 新規登録ルートをスキップする
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new]
  get '/service.html', to: 'pages#service_html'
  get '/users/new', to: 'devise/registrations#new', as: 'new_user_registration'  # 新規登録ルートを追加
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end