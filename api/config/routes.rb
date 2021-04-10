Rails.application.routes.draw do
  get 'products', to: 'products#get'
  get 'products/:id', to: 'products#get'
  post 'products', to: 'products#post'
  put 'products', to: 'products#put'
  delete 'products/delete', to: 'products#delete'
  post 'login', to: 'account#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
