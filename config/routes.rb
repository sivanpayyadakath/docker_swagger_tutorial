Rails.application.routes.draw do
  get 'api_docs/index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'api-docs', to: 'api_docs#index'
end
