Administration::Engine.routes.draw do  
  resources :article_types, :article_categories, :members, :publications

  get "landing/index"
  root "landing#index"
end
