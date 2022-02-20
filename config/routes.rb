# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :admin_users, controllers: {
    sessions: 'admin/users/sessions',
    passwords: 'admin/users/passwords',
    confirmations: 'admin/users/confirmations',
    unlocks: 'admin/users/unlocks',
    registrations: 'admin/users/registrations'
  }, path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }
  namespace :admin do
    root 'home#index'
    resources :categories, only: %i[index new create destroy edit update]
    resources :posts, only: %i[index edit new]

    namespace :api do
      resources :posts, only: %i[show update]
    end
  end
end
