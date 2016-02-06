Rails.application.routes.draw do
  root 'home#index'
  get 'users/search/:query' => 'users#search'

  resource :user do
    member do
      get 'logout'
      get 'login'
      post 'attempt_login'
    end
    resources :musical_hobbies
    resources :drummers
    resources :bassists
    resources :singers
    resources :guitarists
  end

  resources :users, only: [:show, :index]
end
