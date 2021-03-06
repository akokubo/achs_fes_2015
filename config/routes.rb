AchsFes2015::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :homerooms
  resources :posts
  resources :stages
  resources :likes
  root 'static_pages#home'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/rank', to: 'static_pages#rank', via: 'get'
  match '/disp_3rd', to: 'static_pages#disp_3rd', via: 'get'
  match '/disp_2rd', to: 'static_pages#disp_2rd', via: 'get'
  match '/disp_1rd', to: 'static_pages#disp_1rd', via: 'get'
  match '/disp_cul', to: 'static_pages#disp_cul', via: 'get'
  match '/disp_pta', to: 'static_pages#disp_pta', via: 'get'
  match '/stage', to: 'static_pages#stage', via: 'get'
  match '/map', to: 'static_pages#map', via: 'get'
  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/recompute', to: 'posts#recompute', via: 'get'
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
