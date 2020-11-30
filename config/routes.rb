Rails.application.routes.draw do
  get 'movies/seen', to: 'movies#seen'
  resources :movies
  resources :categories

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end

  root to: 'welcome#home'
end
