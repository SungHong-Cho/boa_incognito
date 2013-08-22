CclMuse::Application.routes.draw do

  devise_for :admins

  match "index" => 'main#index', as: "index_main"
  match "about" => 'main#about', as: "about_main"
  match "clip" => 'main#clip', as: "clip_main"
  match "event" => 'main#event', as: "event_main"
  match "consulting" => 'main#consulting', as: "consulting_main"
  match "progress" => 'main#progress', as: "progress_main"
  match "feature" => 'main#feature', as: "feature_main"
  match "kakao" => 'main#kakao', as: "kakao_main"
  match "admin" => 'abouts#index'

  root to: "main#index"

  match 'events/main' => 'events#main'
  match 'abouts/main' => 'abouts#main'
  match 'clips/main' => 'clips#main'
  match 'consultings/main' => 'consultings#main'


  get 'abouts/image_popup', :to => 'abouts#image_popup'
  post 'abouts/image_upload', :to => 'abouts#image_upload'
  get 'events/image_popup', :to => 'events#image_popup'
  post 'events/image_upload', :to => 'events#image_upload'

  resources :abouts, :clips, :events, :consultings, :pictures


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
