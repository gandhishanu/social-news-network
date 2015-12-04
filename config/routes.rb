Rails.application.routes.draw do


  
  
  resources :comments
  resources :categories
  resources :posts
  resources :users
  #resources :forgot_password
  
  
  
  get '/signup'  => 'users#new'
  get '/reset_password'  => 'forgot_password#update'
  get '/forgot_password'  => 'forgot_password#new'
  match '/forgot_password' => 'forgot_password#send_email', via: :post
  match '/login', to: 'sessions#create', via: :post
  match '/login', to: 'sessions#new', via: :get
  get '/auth/:provider/callback', :to => 'sessions#create_omniauth'
  get '/auth/failure', :to => 'sessions#failure'
  get '/showprofile', to: 'users#show'
  
  match '/users/validate/:id/:email_confirm_string', to: 'users#validate_from_email', via: :get
  match '/users/pwr/:id/:email_confirm_string', to: 'forgot_password#reset_password', via: :get
  match '/forgot_password.:id', to: 'forgot_password#update', via: :patch
  get '/flagpost', to: 'posts#flagpost'
  #match 'forgot_password', to: 'forgot_password#send_email'

  get '/logout', :to => 'sessions#destroy'

  get '/login2', :to => 'sessions#create'
  root :to => "posts#index"
  
  get '/search', :to => 'posts#search'

  get '/cast_vote', to: 'votes#cast_vote'

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
