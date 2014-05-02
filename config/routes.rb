ItsNachoProblem::Application.routes.draw do
  resources :sessions, :users, only: [:new, :create]

  get '/logout' => 'sessions#destroy', :as => 'logout'
  root to: 'users#index'

end