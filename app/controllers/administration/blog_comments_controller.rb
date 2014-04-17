require_dependency "administration/application_controller"

module Administration
	class BlogCommentsController < ApplicationController
    skip_before_filter :authenticate_admin!, only: [:create]

		def create
      @blog = Blog.find(params[:blog_id])

      if admin_signed_in? && !user_signed_in?
        params[:blog_comment][:author] = current_admin.id
        params[:blog_comment][:admin] = true
      else
        params[:blog_comment][:author] = current_user.id
        params[:blog_comment][:admin] = false
      end

      comment = @blog.blog_comments.create!(comment_params)

      redirect_to @blog
    end

    def destroy
    end

    private
    def comment_params
      allow = [:content, :admin, :author]
      params.require(:blog_comment).permit(allow)
    end
  end
end
