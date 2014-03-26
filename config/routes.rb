Administration::Engine.routes.draw do
  devise_for :admins, {
    class_name: "Administration::Admin", 
    module: :devise,
    :controllers => { :sessions => "administration/sessions" }
  }

  get "landing/index"
  root "landing#index"
end
