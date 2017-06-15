Rails.application.routes.draw do

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  
  get "/", to: 'reports#index'

  get "/reports", to: 'reports#index'
  get "/reports/new", to: 'reports#new'
  post "/reports/new", to: 'reports#create'
  post "/reports/confirm/:id", to: 'reports#confirm'
  get "/reports/confirm/:id", to: 'reports#post'
  get "/reports/:id", to: 'reports#show'
  get "/reports/edit/:id", to: 'reports#edit'
  patch "/reports/edit/:id", to: 'reports#update'
  get "/reports/city/:city", to: 'reports#city'

  get "/locations", to: 'locations#index'

  post "/comments/:id/new", to: 'comments#create'

  post "/likes/:id", to: 'likes#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
