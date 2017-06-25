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
  get "/reports/:id/edit", to: 'reports#edit'
  patch "/reports/edit/:id", to: 'reports#update'
  get "/reports/city/:city", to: 'reports#city'

  get "/locations", to: 'locations#index'

  post "/comments/:id/new", to: 'comments#create'

  post "/likes/:id", to: 'likes#create'

  get "/guides/new", to: 'guides#new'
  post "/guides/new", to: 'guides#create'
  get "/guides", to: 'guides#index'
  get "/guides/:id", to: 'guides#show'
  get "/guides/:id/edit", to: 'guides#edit'
  patch "/guides/:id/edit", to: 'guides#edit'

  get "/questions/new", to: 'questions#new'
  post "/questions/new", to: 'questions#create'
  get "/questions", to: 'questions#index'
  get "/questions/:id", to: 'questions#show'


  post "/answers/new/:id", to: 'answers#create'
  get "/answers/edit/:id", to: 'answers#edit'
  post "/answers/edit/:id", to: 'answers#update'
  delete "/answers/delete/:id", to: 'answers#destroy'

  get "/tips", to: 'tips#index'
  get "/tips/new", to: 'tips#new'
  post "/tips/new", to: 'tips#create'

  post "/inappropriates", to: 'inappropriates#create'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
