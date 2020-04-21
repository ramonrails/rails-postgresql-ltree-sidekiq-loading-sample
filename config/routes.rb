Rails.application.routes.draw do
  resources :ltree_files
  root 'ltree_files#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
