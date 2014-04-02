require_dependency "administration/application_controller"

module Administration
  class MembersController < ApplicationController
    def index
      @members = Member::User.all
    end

    def show
      @member = Member::User.find(params[:id])
    end

    def new
      @user = Member::User.new
    end

    def create
      @user = Member::User.new(user_params)

      if @user.save
        redirect_to administration.members_path, :notice => "A new type was created!"
      else
        render action: :new, :notice => "An error occured, the type was not saved"
      end
    end

    def edit
      @user = Member::User.new(user_params)
    end

    def update

    end

    def destroy
      @member = Member::User.find(params[:id])
    
      unless @member.destroy
        redirect_to(administration.members_path, notice: "An error occured, the deletion was not successful")
      else
        redirect_to(administration.members_path, notice: "A member's account was deleted")
      end
    end

    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :role)
    end
  end
end
