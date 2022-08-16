# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: 'public' do
    root to: 'home#index'
    get 'about_us', to: 'home#about_us'
    get 'yumans', to: 'home#yumans'
    get 'researchers', to: 'home#researchers'
    get 'projects', to: 'home#projects'
    get 'graphs', to: 'home#graphs'
    get 'bibliographic_search_engine', to: 'bibliographic_search_engine#index', as: :search_engine
  end

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    get "dashboard", to: 'dashboard#index'
    resources :bibliographic_files do
      get "versions", to: "bibliographic_files#versions"
    end
    resources :users
    resources :researchers do
      get 'user_researcher', on: :new
    end
    resources :carousel
  end
end
