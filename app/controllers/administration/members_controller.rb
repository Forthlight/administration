require_dependency "administration/application_controller"

module Administration
  class MembersController < ApplicationController
    def index
      @members = Member::User.all
    end

    def show

    end

    def new
      @user = Article::Type.new
    end

    def create
      @user = Article::Type.new(user_params)

      if @user.save
        redirect_to administration.members_path, :notice => "A new type was created!"
      else
        render action: :new, :notice => "An error occured, the type was not saved"
      end
    end

    def edit
      @user = Article::Type.new(user_params)
    end

    def update

    end

    def destroy

    end

    private
    def user_params
      params.require(:type).permit(:title)
    end
  end
end
