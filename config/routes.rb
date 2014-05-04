ItsNachoProblem::Application.routes.draw do

  get '/logout' => 'sessions#destroy', :as => 'logout'
  root to: 'users#index'

  resources :recipes, only: [:create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :ingredients, only: [:index, :new, :create]
  end
end
