require_dependency "administration/application_controller"

module Administration
  class ArticleTypesController < ApplicationController
    def index
      @types = Article::Type.all
    end

    def new
      @type = Article::Type.new
      variables_for_new
    end

    def create
      @type = Article::Type.new(type_params)

      if @type.save
        redirect_to administration.article_types_path, :notice => "A new type was created!"
      else
        variables_for_new
        render action: :new, :notice => "An error occured, the type was not saved"
      end
    end

    def edit
      @type = Article::Type.find(params[:id])
      variables_for_edit
    end

    def update
      @type = Article::Type.find(params[:id])

      if @type.update_attributes(type_params)
        redirect_to administration.article_types_path, notice: 'Successfully updated.'
      else
        variables_for_edit
        render action: :edit, :notice => "An error occured, the type was not saved"
      end
    end

    def destroy
      @type = Article::Type.find(params[:id])
    
      unless @type.destroy
        redirect_to(administration.article_types_path, notice: "An error occured, the deletion was not successful")
      else
        redirect_to(administration.article_types_path, notice: "A article type was deleted")
      end
    end

    private

    def type_params
      params.require(:type).permit(:title)
    end

    # these variables are required whenever the new view is rendered
    def variables_for_new
      @path = administration.article_types_path
      @method = :post
    end

    # these variables are required whenever the edit view is rendered
    def variables_for_edit
      @path = administration.article_type_path
      @method = :patch
    end
  end
end
