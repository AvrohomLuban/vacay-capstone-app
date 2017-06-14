Rails.application.routes.draw do

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  
  get "/", to: 'reports#search'
  get "/reports", to: 'reports#search'
  get "/reports/new", to: 'reports#new'
  post "/reports/new", to: 'reports#create'
  post "/reports/confirm/:id", to: 'reports#confirm'
  get "/reports/:id", to: 'reports#show'
  get "/reports/edit/:id", to: 'reports#edit'
  patch "/reports/update/:id", to: 'reports#update'
  get "/reports/city/:city", to: 'reports#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
