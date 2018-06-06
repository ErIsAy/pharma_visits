Rails.application.routes.draw do
  resources :visits
  resources :ejes
  resources :cycles
  get 'metric/index'
  get 'metric/print_report'
  get 'metric/registers'

  get 'report/index'

  get 'report/center'

  get 'report/doctor'

  get 'report/doctor_center'

  get 'report/drugstore'

  get 'report/planning'

  get 'report/visits'


  resources :divisions
  get 'products/index'

  get 'products/show'

  resources :drugstores
  resources :plannings
  get 'events/scheduler'
  get 'events/index'
  # resources :events do
  #   get 'scheduler', on: :collection
  # end
  post '/events/index', :to => 'events#create'

  resources :plannings do
    resources :visits

  end

  resources :centers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 
  resources :doctors
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  # get 'application#scrape_reddit'
  #  root 'application#scrape_reddit'

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
