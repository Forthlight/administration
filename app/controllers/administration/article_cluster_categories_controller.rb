require_dependency "administration/application_controller"

module Administration
  class ArticleClusterCategoriesController < ApplicationController
    # Require this in order to avoid uninitialized constant
    require "#{Article::Engine.root}/app/models/article/publication.rb"

    def index
      @clusters = Article::ClusterCategory.all
    end

    def new
      @cluster = Article::ClusterCategory.new
      variables_for_new
    end

    def create
      @cluster = Article::ClusterCategory.new(cluster_category_params)

      if @cluster.save
        redirect_to administration.article_cluster_categories_path, :notice => "A new cluster category was created!"
      else
        variables_for_new
        render action: :new, :notice => "An error occured, the  cluster category was not saved"
      end
    end

    def edit
      @cluster = Article::ClusterCategory.find(params[:id])
      variables_for_edit
    end

    def update
      @cluster = Article::ClusterCategory.find(params[:id])

      if @cluster.update_attributes!(cluster_category_params)
        redirect_to administration.article_cluster_categories_path, notice: 'Successfully updated cluster category.'
      else
        variables_for_edit
        render action: :edit, :notice => "An error occured, the cluster category was not saved"
      end
    end

    private

    def cluster_category_params
      params.require(:cluster_category).permit(:title, :description)
    end

    # these variables are required whenever the new view is rendered
    def variables_for_new
      @path = administration.article_cluster_categories_path
      @method = :post
    end

    # these variables are required whenever the edit view is rendered
    def variables_for_edit
      @path = administration.article_cluster_category_path
      @method = :patch
    end
  end
end
