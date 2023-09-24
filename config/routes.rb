Rails.application.routes.draw do
  resources :user_profiles
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :job_listings, except: [:edit, :new]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :job_details, except: [:edit, :new]
    end
  end

  namespace :api do
    namespace :v1 do
      get '/job_search', to: 'job_search#index'
    end
  end

end
