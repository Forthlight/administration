Administration::Engine.routes.draw do  
  resources :article_types, :article_categories, :members, :publications, :blogs, :blog_comments

  get "landing/index"
  root "landing#index"
end
