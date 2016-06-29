Rails.application.routes.draw do
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

  resources :production_metadata
  resources :company_metadata
  resources :company_social_metadata
  resources :showtime_accessibility_metadata
  resources :theater_metadata
  resources :company_social_metadata
  resources :company_production_links
  resources :showtime_ticket_metadata
  resources :showtime_accessibility_metadata
  resources :production_showtime_links
  resources :showtimes
  resources :theaters
  resources :venues
  resources :company_festival_links
  resources :festival_production_links
  resources :festivals
  resources :reviews
  resources :companies
  resources :press_items
  resources :production_credits, controller: :credits, type: 'ProductionCredit'
  resources :writing_credits, controller: :credits, type: 'WritingCredit'
  resources :staff_credits, controller: :credits, type: 'StaffCredit'
  resources :productions do
    collection do
      get :autocomplete
    end
  end
  resources :artists do
    collection do
      get :autocomplete
    end
  end
  devise_for :users
  root 'static#home'
  resources :users, only: [:show, :index]
  get 'user/:id/like', to: 'users#like', as: :like
  get 'user/:id/follow', to: 'users#follow', as: :follow
  get 'user/:id/unlike', to: 'users#unlike', as: :unlike
  get 'user/:id/unfollow', to: 'users#unfollow', as: :unfollow

  namespace :api do
    namespace :v1 do
      jsonapi_resources :users
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
