Rails.application.routes.draw do

  resources :til_logs
  devise_for :users
  root 'pages#home'
  get 'pages/about', as: :about

end
