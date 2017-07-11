Rails.application.routes.draw do

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  namespace :api do
    namespace :v1 do
      get "/reports", to: "reports#index"
      post "/reports", to: "reports#create"
      get "/reports/:id", to: "reports#show"
      get "/locations", to: "locations#index"
      post "/locations", to: "locations#create"
      get "/destinations", to: "destinations#index"
      post "/destinations", to: "destinations#create"
      get "/photos", to: "photos#index"
      post "/photos", to: "photos#create"
      get "/tips", to: "tips#index"
      post "tips", to: "tips#create"
      get "/bookmarks", to: "bookmarks#index"
      post "/bookmarks", to: "bookmarks#create"
    end
  end

  
 
  get"/", to: 'reports#index'
  get "/reports/newvue", to: 'reports#newvue'
  get "/reports/new", to: 'reports#new_part_1'
  post "/reports/new_part_1", to: 'reports#new_part_2'
  post "/reports/new_part_2", to: 'reports#new_part_3'
  post "/reports/new_part_3", to: 'reports#new_part_4'
  post "/reports/new_part_4", to: 'reports#create'
  get "/reports/index", to: 'reports#index'
  post "/reports/new", to: 'reports#create'
  post "/reports/confirm/:id", to: 'reports#confirm'
  get "/reports/:id", to: 'reports#show'
  get "/reports/:id/edit", to: 'reports#edit'
  patch "/reports/edit/:id", to: 'reports#update'
  get "/reports/city/:city", to: 'reports#city'
 

  get "/locations/", to: 'locations#index'

  post "/comments/:id/new", to: 'comments#create'

  post "/likes/:id", to: 'likes#create'

  get "/guides/new", to: 'guides#new'
  post "/guides/new", to: 'guides#create'
  get "/guides", to: 'guides#index'
  get "/guides/:id", to: 'guides#show'
  get "/guides/:id/edit", to: 'guides#edit'
  patch "/guides/:id/edit", to: 'guides#edit'

  get "/questions/new", to: 'questions#new_part_1'
  post "/questions/new_part_1", to: 'questions#new_part_2'
  post "/questions/new_part_2", to: 'questions#new_part_3'
  post "/questions/new_part_3", to: 'questions#new_part_4'
  post "/questions/new_part_4", to: 'questions#create'

  # get "/questions/new", to: 'questions#new'
  # post "/questions/new", to: 'questions#create'
  get "/questions", to: 'questions#index'
  get "/questions/:id", to: 'questions#show'


  post "/answers/new/:id", to: 'answers#create'
  get "/answers/edit/:id", to: 'answers#edit'
  post "/answers/edit/:id", to: 'answers#update'
  delete "/answers/delete/:id", to: 'answers#destroy'

  get "/tips", to: 'tips#index'
  get "/tips/new", to: 'tips#new_part_1'
  post "/tips/new_part_1", to: 'tips#new_part_2'
  post "/tips/new_part_2", to: 'tips#new_part_3'
  post "/tips/new_part_3", to: 'tips#new_part_4'
  post "/tips/new_part_4", to: 'tips#create'


  # post "/tips/new", to: 'tips#create'

  post "/inappropriates", to: 'inappropriates#create'

  get "/contact", to: 'contacts#index'

  get "/vue", to: 'reports#vue'

  get "/photos/new", to: 'photos#new'
  post "/photos", to: 'photos#create'
  get "/photos", to: 'photos#index'

  post "/bookmarks/new/:id", to: 'bookmarks#create'
  get "/bookmarks", to: 'bookmarks#index'
  delete "/bookmarks/:id", to: 'bookmarks#destroy'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end