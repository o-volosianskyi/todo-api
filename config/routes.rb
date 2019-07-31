Rails.application.routes.draw do
  resources :items
  post '/items/checkout', to: 'items#checkout'
end
