Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks, except: [:index, :show] do
    get ':type', action: :index,
                 on: :collection,
                 as: :filtered,
                 constraints: { type: /open|done/ }
    member do
      put :update_title
    end
  end
end
