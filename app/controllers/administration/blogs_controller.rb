require_dependency "administration/application_controller"

module Administration
  class BlogsController < ApplicationController
    
    def index
      @blogs =  Administration::Blog.all.order("created_at ASC").page(params[:page]).per(5)
    end

    def show
      @blog = Administration::Blog.find(params[:id])
    end

    def edit
      @blog = Administration::Blog.find(params[:id])
    end

    def new
      @blog = Administration::Blog.new
    end

    def create
      @blog =  Administration::Blog.new(blog_params)
      @blog.author =  current_admin.id
      
      if @blog.save
        redirect_to administration.blogs_path, :notice => "A new post was created!"
      else
        variables_for_new
        render action: :new, :notice => "An error occured, the type was not saved"
      end
    end

    def update 
      @blog = Administration::Blog.find(params[:id])
      @blog.author =  current_admin.id

      if @blog.update_attributes(blog_params)
        redirect_to @blog, notice: 'Post was successfully updated.'
      else
        render action: :edit, notice: "Update failed, please try again"
      end
    end

    def destroy
      @blog = Blog.find(params[:id])
      @blog.destroy

      redirect_to blogs_path
    end

    private
    def blog_params
      allow = [:title, :content, :author, :published]
      params.require(:blog).permit(allow)
    end
  end
end
