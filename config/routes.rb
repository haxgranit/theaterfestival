Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'home/home'

  namespace :admin do
    resources :users
    resources :artists
    resources :companies
    resources :venues
    resources :productions
    resources :showtimes
    resources :theaters
    resources :festivals
    resources :artist_social_metadata
    resources :company_festival_links
    resources :company_metadata
    resources :company_production_links
    resources :company_social_metadata
    resources :credits
    resources :festival_production_links
    resources :permissions
    resources :photos
    resources :photo_albums
    resources :pictures
    resources :press_items
    resources :production_metadata
    resources :production_showtime_links
    resources :reviews
    resources :showtime_accessibility_metadata
    resources :showtime_ticket_metadata
    resources :theater_metadata
    resources :likes
    resources :mentions
    resources :follows

    root to: "users#index"
  end

  concern :permissible do
    resources :permissions
  end

  concern :albums do
    resources :photo_albums, path: :albums do
      resources :photos
    end
  end

  concern :claimable do
    patch :claim
  end

  concern :social do
    post :like
    post :follow
    post :unlike
    post :unfollow
  end

  concern :search do
    collection do
      get :search_internal, as: :search, path: :search
    end
  end
  concern :autocomplete do
    collection do
      get :autocomplete
    end
  end

  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  resources :users, only: [:show, :index] do
    concerns [:social, :autocomplete]
  end

  get :profile, to: 'users#show'

  resource :search, controller: 'search' do
    concerns [:autocomplete]
  end

  resources :artists do
    concerns [:permissible, :social, :autocomplete, :claimable, :albums]
  end

  resources :companies do
    concerns [:permissible, :social, :autocomplete, :claimable, :albums]
  end

  resources :festivals do
    concerns [:permissible, :social, :autocomplete, :claimable, :albums]
    resources :steps, only: [:show, :update], controller: 'festival/steps'
    member do
      get :quickview
    end
  end

  resources :productions do
    concerns [:permissible, :social, :autocomplete, :search, :claimable, :albums]
    resources :steps, only: [:show, :update], controller: 'production/steps'
    member do
      get :quickview
    end
  end
  resources :production_metadata

  resources :credits

  resources :theaters do
    concerns [:permissible, :social, :autocomplete, :claimable]
  end

  resources :venues do
    concerns [:permissible, :social, :autocomplete, :claimable, :albums]
  end

  resources :activities

  resources :press_items
  resources :reviews
  resources :showtimes

  resources :company_production_links
  resources :company_festival_links
  resources :festival_production_links
  resources :production_showtime_links

  get :create_show, to: 'static#create_show'
  get :privacy, to: 'static#privacy'
  get :terms, to: 'static#terms'

  get :page_not_found, to: 'exceptions#page_not_found'
  get :unprocessable, to: 'exceptions#unprocessable'
  get :server_error, to: 'exceptions#server_error'

  root 'home#home'

  namespace :api do
    namespace :v1 do
      jsonapi_resources :artists
      jsonapi_resources :companies
      jsonapi_resources :productions
      jsonapi_resources :showtimes
      jsonapi_resources :theaters
      jsonapi_resources :users
      jsonapi_resources :venues
    end
  end
end
