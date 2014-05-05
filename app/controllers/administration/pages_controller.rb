require_dependency "administration/application_controller"

module Administration
  class PagesController < ApplicationController
    skip_before_filter :authenticate_admin!, only: [:show]

    def index
      @pages =  Administration::Page.all.order("created_at ASC").page(params[:page]).per(5)
    end

    def show
      @page = Administration::Page.find(params[:id])
    end

    def edit
      @page = Administration::Page.find(params[:id])
      variables_for_edit
    end

    def new
      @page = Administration::Page.new
    end

    def create
      @page = Administration::Page.new(page_params)
      
      if @page.save
        redirect_to administration.pages_path, :notice => "A new post was created!"
      else
        variables_for_new
        render action: :new, :notice => "An error occured, the type was not saved"
      end
    end

    def update 
      @page = Administration::Page.find(params[:id])

      if @page.update_attributes(page_params)
        redirect_to pages_path, notice: 'Post was successfully updated.'
      else
        render action: :edit, notice: "Update failed, please try again"
      end
    end

    def destroy
      @page = Page.find(params[:id])
      @page.destroy

      redirect_to pages_path
    end

    private
    def page_params
      allow = [:title, :content]
      params.require(:page).permit(allow)
    end

    def variables_for_new
      @path = administration.pages_path
      @method = :post
    end

    def variables_for_edit
      @path = administration.page_path
      @method = :patch
    end
  end
end
