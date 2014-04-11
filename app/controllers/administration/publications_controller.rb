require_dependency "administration/application_controller"

module Administration
  class PublicationsController < ApplicationController
    def index
      @publications = Article::Publication.all
    end

    def show
      @publication = Article::Publication.find(params[:id])
    end

    def edit
      @publication = Article::Publication.find(params[:id])
    end

    def update
      @publication = Article::Publication.find(params[:id])

      if @publication.update_attributes(publication_params)
        redirect_to administration.publications_path, notice: 'Successfully updated'
      else
        render action: :edit, :notice => "An error occured, the article was not updated"
      end
    end

    def destroy
      def destroy
        @publication = Article::Publication.where(author: current_user.id).find(params[:id])
      
        unless @publication.destroy
          redirect_to(administration.publications_path, notice: "An error occured, the deletion was not successful")
        else
          redirect_to(administration.publications_path, notice: "An article was deleted")
        end
      end
    end

    private

    def publication_params
      params.require(:publication).permit(:title, :content, :published, :type_id, :category_id)
    end
  end
end
