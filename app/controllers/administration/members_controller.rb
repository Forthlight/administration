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
      variables_for_new
    end

    def create
      @user = Member::User.new(user_params)

      if @user.save
        redirect_to administration.members_path, :notice => "A new type was created!"
      else
        variables_for_new
        render action: :new, :notice => "An error occured, the type was not saved"
      end
    end

    def edit
      @user = Member::User.find(params[:id])
      variables_for_edit
    end

    def update
      @user = Member::User.find(params[:id])

      if @user.update_attributes(user_params)
        redirect_to administration.members_path, notice: 'Member was successfully updated.'
      else
        variables_for_edit
        render action: :edit, notice: "Update failed, please try again"
      end
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

    # these variables are required whenever the new view is rendered
    def variables_for_new
      @path = administration.members_path
      @method = :post
    end

    # these variables are required whenever the edit view is rendered
    def variables_for_edit
      @path = administration.member_path
      @method = :patch
    end
  end
end
