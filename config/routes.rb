Site::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }
  # devise_for :users, controllers: { sessions: "users/sessions" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#show', id: 'home'
  
  get 'aanmelden', to: 'mcsubscribe#index'
  post 'mcsubscribe/subscribe' => 'mcsubscribe#subscribe'
  get 'users/check_email' => 'users#check_email'
  
  get 'nieuws', to: 'posts#index', as: 'nieuws'
  get 'contact', to: 'questions#new', as: 'contact'

  get 'inopdracht', to: 'pages#inopdracht', id: 'inopdracht'
  
  get 'overzicht', to: 'pages#overzicht', id: 'overzicht'
  get 'home', to: 'pages#show', id: 'home'
  
  get 'cursussen', to: 'pages#category', id: 'cursussen'
  get 'rondleidingen', to: 'pages#category', id: 'rondleidingen'
  get 'lezingen', to: 'pages#category', id: 'lezingen'
  get 'cultuurtrips', to: 'pages#category', id: 'cultuurtrips'
  
  get ':id', to: 'pages#show', as: :page
  get 'categories/:name' => 'categories#show', as: :name
  resources :categories, :products, :transactions, :posts, :events
  resources :questions, only: [:new, :create]

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
