Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  
  root 'welcome#demo'

  
  resources :articles do
    collection do 
      get :load_article_comments
      get :new_comment_section
    end
  resources :comments
  end

  namespace :admins do
    resources :articles
  end

  namespace :authors do
    resources :articles
  end
  
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

