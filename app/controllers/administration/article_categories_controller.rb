require_dependency "administration/application_controller"

module Administration
  class ArticleCategoriesController < ApplicationController
    def index
      @categories = Article::Category.all
    end

    def new
      @category = Article::Category.new
      variables_for_new
    end

    def create
      @category = Article::Category.new(category_params)

      if @category.save
        redirect_to administration.article_categories_path, :notice => "A new category was created!"
      else
        variables_for_new
        render action: :new, :notice => "An error occured, the category was not saved"
      end
    end

    def edit
      @category = Article::Category.find(params[:id])
      variables_for_edit
    end

    def update
      @category = Article::Category.find(params[:id])

      if @category.update_attributes(category_params)
        redirect_to administration.article_categories_path, notice: 'Successfully updated.'
      else
        variables_for_edit
        render action: :edit, :notice => "An error occured, the category was not saved"
      end
    end

    private

    def category_params
      params.require(:category).permit(:title)
    end

    # these variables are required whenever the new view is rendered
    def variables_for_new
      @path = administration.article_categories_path
      @method = :post
    end

    # these variables are required whenever the edit view is rendered
    def variables_for_edit
      @path = administration.article_category_path
      @method = :patch
    end
  end
end
