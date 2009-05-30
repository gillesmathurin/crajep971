ActionController::Routing::Routes.draw do |map|
  
  map.resources :home
  map.accueil '/accueil', :controller => 'home', :action => 'index'
  map.contacts '/contacts', :controller => 'home', :action => 'contacts'
  
  map.resources :nl_contents

  map.resources :newsletters, :member => { :deliver => :get }, :collection => {:unsubscribe => :get}

  map.resources :candidatures

  map.resources :abonnes
  
  map.resources :categorie_actions, :has_many => :actions
  
  map.resources :actions
  
  map.resources :articles, :has_many => :comments
  map.articles_du_jour '/articles_du_jour/:day', :controller => 'articles', :action => 'articles_du_jour', :day => nil
  map.articles_du_mois '/articles_du_mois/:day', :controller => 'articles', :action => 'articles_du_mois', :day => nil
  
  map.resources :comments
  
  map.resources :evenements
  
  map.resources :liens
  
  map.resources :reseaux
  
  map.resources :cpte_rendus, :member => {:download => :get}
  
  map.resources :membres
  
  map.evenenemts_du_jour '/evenements_du_jour/:day', :controller => 'evenements', :action => 'evenenemts_du_jour', :day => nil
  map.evenements_du_mois '/evenements_du_mois/:day', :controller => 'evenements', :action => 'evenements_du_mois', :day => nil
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.resources :users, :member => { :suspend => :put, :unsuspend => :put, :purge => :delete }

  map.resource :session
  
  # map.root :controller => 'home', :action => 'index'
  map.root "/public/system/maintenance.html"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
