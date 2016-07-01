Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'users' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'application#index'

  get :csrf, to: 'csrf#index'
end
