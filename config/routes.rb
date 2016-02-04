Rails.application.routes.draw do
  root 'home#index'
  get 'users/search/:query' => 'users#search'
  match ':controller(/:action(/:id))', via: [:get, :post, :delete]
end
