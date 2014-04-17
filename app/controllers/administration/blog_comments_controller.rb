require_dependency "administration/application_controller"

module Administration
	class BlogCommentsController < ApplicationController
		def create
      @blog = Blog.find(comment_params)
      @blog_comment = @blog.blog_comments.create!(params[:blog_comment])
      redirect_to @blog
    end

    def destroy
    end

    private
    def comment_params
      allow = [:author, :content]
      params.require(:blog_comment).permit(allow)
    end
  end
end
