Administration::Engine.routes.draw do  
  resources :article_types, :article_categories, :article_cluster_categories, :members, :publications, :admins

  resources :blogs do
    resources :blog_comments
  end

  get "landing/index"
  root "landing#index"
end
