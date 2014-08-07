Zinvoice::Application.routes.draw do

  root to: 'invoices#index'

  resources :invoices do
    #resources :invoice_rows, shallow: true
  end

  #get '/invoices/:invoice_id/form_for/invoice_row', to: 'invoice_rows#form_for', as: 'form_for_invoice_rows'
  #post '/invoices/:invoice_id/form_for/invoice_row', to: 'invoice_rows#form_for_update'

  resources :invoice_rows

  inline_route_for :invoice_rows
#  get '/invoice_row/form_for', to: 'invoice_rows#form_for', as: 'form_for_invoice_rows'
#  post '/invoice_row/form_for', to: 'invoice_rows#form_for_update'

  resources :supports

  resources :customers

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
