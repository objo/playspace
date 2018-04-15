Rails.application.routes.draw do
  get 'calendar/show'

  devise_for :users
  root "welcome#index"
  resource :calendar, only: [:show], controller: :calendar
  resources :events, only: [:new, :create]
end
