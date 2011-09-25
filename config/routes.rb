TouchCatalogue::Application.routes.draw do
  root :to => 'releases#index'

  resources :artists
  resources :releases
  resources :admin_sessions
  
  match 'releases/publisher/:publisher.:format', :to => 'releases#list_by_publisher'
end
