ItsNachoProblem::Application.routes.draw do

  get '/logout' => 'sessions#destroy', :as => 'logout'
  root to: 'users#index'

  resources :recipes, only: [:create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    collection do
      post 'favorite_recipe'
    end
    resources :ingredients, only: [:index, :new, :create] do
      collection do
        get 'search'
      end
    end
    get '/nachoresult' => 'recipes#show', as: 'nachoresult'
  end
end
