Friends::Application.routes.draw do
  
  patch 'users/:user_id/meetups/:id/accept' => 'meetups#accept', as: :accept_meetup #accept meet up

  resources :users do
    resources :meetups
  end

  # Profile
  get 'profile' => 'profile#index' # list all profiles 
  get 'profile/edit_current' => 'profile#edit_current', as: :edit_current # form to edit profile
  get 'profile/search' => 'profile#search', as: :search_profiles
  get 'profile/:id' => 'profile#show', as: :show_profile # show one profile
  get 'profile/:id/edit' => 'profile#edit', as: :edit_profile # form to edit profile
  put 'profile/:id' => 'profile#update' # update a profile
  patch 'profile/:id' => 'profile#update' # update a profile  


  scope :api do
    resources :profiles, except: [ :new, :edit ], default: {format: :json}

    get 'profiles/:profile_id/subjects/:subject_id' => 'subjects#show'
  end

  # Sign in/out
  get    'login' => 'session#new', as: :login
  post   'login' => 'session#create'
  delete 'logout' => 'session#destroy', as: :logout
  get    'logout' => 'session#destroy'
  
  # Registration
  get  'register/:code' => 'registration#new', as: :register
  post 'register/:code' => 'registration#create'
  
  # Password reset
  get   'reset/:code' => 'password#edit', as: :reset
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'
  
  get 'privacy' => 'site#privacy'
  get 'terms'   => 'site#terms'
  
  root 'profile#show_current'
end
