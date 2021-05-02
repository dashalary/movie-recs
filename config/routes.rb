Rails.application.routes.draw do
  get 'movies/seen', to: 'movies#seen'
  # get 'movies/oldest', to: 'movies#oldest'
  resources :movies
  resources :categories, only: [:index, :show, :new]  do 
    resources :movies, only: [:index, :show, :new]
  end 

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end

  root to: 'welcome#home'

  get ':not_found' => redirect('/'), :constraints => { :not_found => /.*/ }
end
