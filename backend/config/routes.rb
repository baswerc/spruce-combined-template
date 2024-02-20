# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  namespace :v1 do
    resources :apidocs, only: [:index]
  end
end
