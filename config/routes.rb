Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'results', to: 'pages#results'

  resources :movies, only: [ :index, :create, :show, :destroy, :edit, :update ]

end
