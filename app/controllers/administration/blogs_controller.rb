require_dependency "administration/application_controller"

module Administration
  class BlogsController < ApplicationController
    skip_before_filter :authenticate_admin!, only: [:index, :show]
    def index
     @blogs =  Administration::Blog.all.reverse
   end

   def show
    @blog = Administration::Blog.find(params[:id])
  end

  def edit
    @blog =  Administration::Blog.find(params[:id])
  end

  def new
    @blog = Administration::Blog.new
  end

  def create
    @blog =  Administration::Blog.new(blog_params)
    if @blog.save
      redirect_to administration.blogs_path, :notice => "A new post was created!"
    else
      variables_for_new
      render action: :new, :notice => "An error occured, the type was not saved"
    end
  end

  def update 
    @blog = Administration::Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(blog_params)
        format.html { redirect_to @blog, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy


    respond_to do |format|
      format.html { redirect_to blogs_url }
    end
  end

    private
    def blog_params
      allow = [:title, :content, :author]
      params.require(:blog).permit(allow)
    end
  end
end
