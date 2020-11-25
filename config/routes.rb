Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  root to: 'welcome#home'
  
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
  end

  devise_scope :user do 
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end

  resources :movies
end
