Rails.application.routes.draw do
  concern :permissible do
    resources :permissions
  end

  concern :social do
    post :like
    post :follow
    post :unlike
    post :unfollow
  end

  concern :search do
    collection do
      get :autocomplete
    end
  end

  devise_for :users
  resources :users, only: [:show, :index] do
    concerns [:social, :search]
  end

  get :profile, to: 'users#show'

  resources :artists do
    patch :claim
    concerns [:permissible, :social, :search]
  end

  resources :companies do
    concerns [:permissible, :social, :search]
  end

  resources :festivals do
    concerns [:permissible, :social, :search]
  end

  resources :productions do
    concerns [:permissible, :social, :search]
  end

  resources :theaters do
    concerns [:permissible, :social, :search]
  end

  resources :venues do
    concerns [:permissible, :social, :search]
  end

  resources :press_items
  resources :reviews
  resources :showtimes

  resources :company_production_links
  resources :company_festival_links
  resources :festival_production_links
  resources :production_showtime_links

  resources :production_credits, controller: :credits, type: 'ProductionCredit'
  resources :writing_credits, controller: :credits, type: 'WritingCredit'
  resources :staff_credits, controller: :credits, type: 'StaffCredit'
  root 'static#home'




  namespace :api do
    namespace :v1 do
      jsonapi_resources :users
    end
  end

  namespace :admin do
    resources :users
    resources :artists
    resources :artist_social_metadata
    resources :companies
    resources :company_festival_links
    resources :company_metadata
    resources :company_production_links
    resources :company_social_metadata
    resources :credits
    resources :festivals
    resources :festival_production_links
    resources :pictures
    resources :press_items
    resources :productions
    resources :production_metadata
    resources :production_showtime_links
    resources :reviews
    resources :showtimes
    resources :showtime_accessibility_metadata
    resources :showtime_ticket_metadata
    resources :theaters
    resources :theater_metadata
    resources :venues
    resources :follows
    resources :likes
    resources :mentions
    resources :production_credits
    resources :staff_credits
    resources :writing_credits

    root to: "users#index"
  end

end
