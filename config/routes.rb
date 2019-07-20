Rails.application.routes.draw do
  devise_for :users
    root 'situations#index'
    resources :situations do
      resources :metaphors
    end
  get   'users/:id'   =>  'users#show'
end
