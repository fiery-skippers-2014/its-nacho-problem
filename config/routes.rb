ItsNachoProblem::Application.routes.draw do

  get '/logout' => 'sessions#destroy', :as => 'logout'
  root to: 'users#index'

  resources :recipes, only: [:create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :ingredients, only: [:index, :new, :create]
    get '/nachoresult' => 'recipes#show', as: 'nachoresult'
  end
end
