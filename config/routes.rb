Administration::Engine.routes.draw do
  devise_for :admins, {
    class_name: "Administration::Admin", 
    module: :devise,
    :controllers => { :sessions => "administration/sessions" }
  }
  
  resources :article_types, :article_categories, :members

  get "landing/index"
  root "landing#index"
end
