Rails.application.routes.draw do
  resources :records
  resources :studies
  resources :maps, except: :show
  resources :users

  resources :maps do
    collection { post :import }
    member do
     get 'states'
     get 'us_states'
     get 'us_counties'
    end
  end

  # get 'maps/:id/:state' => 'maps#show', :as => 'state'
  # get 'maps/:id/:us_states' => 'maps#show', :as => 'us_states'
  # get 'maps/:id/:us_counties' => 'maps#show', :as => 'us_counties'

  # get 'maps/state_maps/:id' => 'map#show'


  # resources :records do
  #   collection { post :import }
  # end
  # root to: 'records#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # match '/views/layouts/home' =>  'layouts#home'

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
