Rails.application.routes.draw do


  resources :band_data

  resources :workouts

  resources :workout_types

  resources :users

  resources :sessions

  resources :goals

  # resources :goal_types

  resources :bands

  resources :band_types

  root  'static_pages#home'
  get 'users/edit/:id' => 'users#edit', :as => :edit_current_user
  get 'users/new' => 'users#new', :as => :signup
  get 'logout' => 'sessions#destroy', :as => :logout
  #get 'sessions/new' => 'sessions#new', :as => :login
  get 'login' => 'sessions#new', :as => :login

  get '/users/disable_user/:id/:active' => 'users#disable_user'
  get 'users/search' => 'users#search'


  get 'goal/history/:id' => 'goals#history'
  

  #devise_for :users

  #resources :bands

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
