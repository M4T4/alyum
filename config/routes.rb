# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: 'public' do
    root to: 'home#index'
    get 'about_us', to: 'home#about_us'
    get 'yumans', to: 'home#yumans'
    get 'researchers', to: 'home#researchers'
    get 'projects', to: 'home#projects'
    get 'repositories', to: 'home#repositories'
    get 'graphs', to: 'home#graphs'
    get 'bibliographic_search_engine', to: 'search_engine#bibliographic', as: :bibliographic_search_engine
    get 'lexico_search_engine', to: 'search_engine#lexico', as: :lexico_search_engine
    get "alphabet", to: 'search_engine#alphabet', as: :alphabet_lexico_search_engine
  end

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    get "dashboard", to: 'dashboard#index'
    resources :carousel
    resources :users do 
      get 'edit_password'
      patch 'update_password'
    end
    resources :projects
    resources :repositories
    resources :bibliographic_files do
      get "versions", to: "bibliographic_files#versions"
      get "researchers", to: "bibliographic_files#researchers"
      post "add_researcher", to: "bibliographic_files#add_researcher"
      post "remove_researcher", to: "bibliographic_files#remove_researcher"
    end
    resources :lexico_files do
      get "alphabet", to: "lexico_files#alphabet"
    end
    resources :alphabets
    resources :languages
    resources :researchers do
      get 'user_researcher', on: :new
    end
  end
end
