Rails.application.routes.draw do
  root 'home#index'
  get 'users/search/:query' => 'users#search'
  resources :musicians do
    resources :reviews
  end
  resource :user do
    member do
      get 'login'
      post 'attempt_login'
      post 'logout'
      get 'add_instrument'
    end
  end
  resources :users
  resource :drummer
  resource :singer
  resource :bassist
  resource :guitarist
end
