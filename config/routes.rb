Rails.application.routes.draw do
  devise_for :users, only: []

  namespace :api, defaults: { format: :json } do
    resource :login, only: :create
  end

end
