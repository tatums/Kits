BackstageX::Application.routes.draw do
  root :to => 'products#index'

  resources :products
  resources :kits do
    resources :kits
    resources :products
  end

end
