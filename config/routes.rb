Rails.application.routes.draw do
  get 'users/new'
  get '/tasks' => 'tasks#index'
  # root to: 'tasks#index'
  resources :tasks, except: [:index, :show] do
    patch '/', action: :update_all, on: :collection
    get ':type', action: :index,
                 on: :collection,
                 as: :filtered,
                 constraints: { type: /open|done/ }
  end

  root to: 'gif#cool'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end