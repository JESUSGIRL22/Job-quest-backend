Rails.application.routes.draw do
  # Defined routes for user profiles
  resources :user_profiles, only: [:show, :edit, :update, :destroy]

  # Defined application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defined the root path route ("/")
  root to: "home#index"

  # Devise routes for user authentication
  devise_for :users

  #In an attempt to consolidate the API routes
  # Defined API routes within the 'api/v1' namespace
  namespace :api do
    namespace :v1 do
      # Defined API routes for job listings and job details
      resources :job_listings, :job_details, except: [:edit, :new]

      # Defined a single route for job search and user search
      get '/search', to: 'job_search#index', on: :collection
    end
  end
end
