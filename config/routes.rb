Rails.application.routes.draw do
  resources :movies
  root to: 'welcome#home'
  devise_for :users, :controllers => { :registrations => 'registrations', :omniauth_callbacks => 'callbacks' }

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
  end

  devise_scope :user do 
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end

end
