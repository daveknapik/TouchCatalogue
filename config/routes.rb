TouchCatalogue::Application.routes.draw do
  root :to => 'releases#index'

  resources :releases do
    collection do
      get 'search'
    end
  end

  resources :artists
  resources :releases
  resources :admin_sessions
  
  match 'releases/publisher/:publisher', :to => 'releases#list_by_publisher'
end
