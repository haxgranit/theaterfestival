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

  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: [:show, :index] do
    concerns [:social, :autocomplete]
  end

  get :profile, to: 'users#show'

  resources :artists do
    concerns [:permissible, :social, :autocomplete, :claimable, :albums]
  end

  resources :companies do
    concerns [:permissible, :social, :autocomplete, :claimable, :albums]
  end

  resources :festivals do
    concerns [:permissible, :social, :autocomplete, :claimable, :albums]
  end

  resources :productions do
    concerns [:permissible, :social, :autocomplete, :search, :claimable, :albums]
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

  root 'static#home'

  namespace :api do
    namespace :v1 do
      jsonapi_resources :users
    end
  end
end
