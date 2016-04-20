Rails.application.routes.draw do
  root 'home#index'
  get 'users/search/:query' => 'users#search'
  get 'musicians/search' => 'musicians#search'
  resources :musicians do
    resources :reviews
  end
  resource :user do
    member do
      get 'login'
      post 'attempt_login'
      post 'logout'
      get 'add_instrument'
      get 'change_password'
    end
  end
  resources :users, only: [:index]
  resource :drummer
  resource :singer
  resource :bassist
  resource :guitarist
end
