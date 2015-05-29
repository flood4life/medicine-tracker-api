Rails.application.routes.draw do
  devise_for :users, only: []

  scope defaults: { format: :json } do
    resources :login, only: :create, controller: :session
    resources :users
    resources :rules
  end

end
