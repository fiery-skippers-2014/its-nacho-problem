ItsNachoProblem::Application.routes.draw do
  resources :sessions, :users, :ingredients, :recipes

  get '/logout' => 'sessions#destroy', :as => 'logout'
  root to: 'users#index'

end
