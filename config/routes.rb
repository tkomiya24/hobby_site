Rails.application.routes.draw do
  root 'home#index'
  get 'users/search/:query' => 'users#search'
  resources :reviews
  match ':controller(/:action(/:id))', via: [:get, :post, :delete, :patch]
end
