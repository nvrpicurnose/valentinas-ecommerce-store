Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root 'models#index'


  resources :submits
  get 'index'=>'submits#index'
  get 'show'=>'submits#show'
  get 'thanks' => 'submits#thanks'
  get 'new'=>'submits#new'
  post 'new'=>'submits#create'
  post 'submits/:id' => "submits#show"
  get 'edit'=>'submits#edit'
  patch 'submits/:id' => 'submits#update'
  get 'delete' => 'submits#delete'
  post 'delete' => 'submits#destroy'

  resources :models
  get 'index'=>'models#index'
  get 'show'=>'models#show'
  get 'new'=>'models#new'
  post 'new'=>'models#create'
  post 'models/:id' => "models#show"
  get 'edit'=>'models#edit'
  patch 'jeans/:id' => 'jeans#update'
  get 'delete' => 'models#delete'
  post 'delete' => 'models#destroy'

  resources :jeans
  get "index" => "jeans#index"
  get "new" => "jeans#new"
  post "new" => "jeans#create"
  get "show" => "jeans#show"
  post "jeans/:id" => "jeans#show"
  get "edit" => "jeans#edit"
  patch "jeans/:id" => "jeans#update"
  get "delete" => "jeans#delete"
  post "delete" => "jeans#destroy"


  get "aboutus" => "abouts#aboutus"
  get "admin_controls" => "abouts#admin_controls"
  get "profile" => "abouts#profile"


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
