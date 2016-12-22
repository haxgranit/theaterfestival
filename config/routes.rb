Rails.application.routes.draw do
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

  root 'static#home'

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
