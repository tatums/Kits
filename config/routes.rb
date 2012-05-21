BackstageX::Application.routes.draw do
  root :to => 'products#index'
  resources :kits do
    resources :kits, :shallow => true
    resources :products, :shallow => true
  end
  resources :kits
  resources :products


end
