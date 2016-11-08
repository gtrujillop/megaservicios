Rails.application.routes.draw do
  devise_for :users
  root 'users#show'

  resources :appliances, only: [:index, :new, :create, :show]

  get 'users/:user_id/appliances', to: 'appliances#index', as: 'user_appliances'
  get 'users/:user_id/appliances/:id', to: 'appliances#show', as: 'show_user_appliance'

  get 'users/:user_id/services', to: 'services#index', as: 'user_services'
  get 'users/:user_id/services/:id', to: 'services#show', as: 'show_user_services'



  scope :users, controller: 'users' do
    post 'create', as: 'create_user'
    get 'new', as: 'new_user'
    get 'edit', as: 'edit_user'
    put 'update', as: 'update_user'
    get 'index', as: 'user_list'
    delete 'destroy', as: 'destroy_user'
    get 'user_details', as: 'user_details'
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
