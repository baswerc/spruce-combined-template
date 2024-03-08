# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations]

  get '/', to: 'welcome#index'

  namespace :v1 do
    resources :apidocs, only: [:index]
  end
end
