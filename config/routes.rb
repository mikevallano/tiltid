Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'
  get 'pages/about', as: :about
  resources :til_logs
  resources :tid_logs
  get 'pages/youtube_downloader', to: 'pages#youtube_downloader'
  get 'pages/download_youtube', to: 'pages#download_youtube'
end
