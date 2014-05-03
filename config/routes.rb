ItsNachoProblem::Application.routes.draw do

  get '/logout' => 'sessions#destroy', :as => 'logout'
  root to: 'users#index'

  resources :recipes, only: [:create]

  resources :session, only: [:new, :create, :destroy]

  resources :user do
    resources :ingredients, only: [:index, :new, :create]
  end
end
