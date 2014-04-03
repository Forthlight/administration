Administration::Engine.routes.draw do  
  resources :article_types, :article_categories, :members

  get "landing/index"
  root "landing#index"
end
