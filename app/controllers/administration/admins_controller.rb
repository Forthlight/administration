require_dependency "administration/application_controller"

module Administration
  class AdminsController < ApplicationController
    def index
      @admins = Administration::Admin.all
    end

    def show
      @admin = Administration::Admin.find(params[:id])
    end

    def new
      @admin = Administration::Admin.new
      variables_for_new
    end

    def create
      @admin = Administration::Admin.new(admin_params)

      if @admin.save
        redirect_to administration.admins_path, :notice => "A new type was created!"
      else
        variables_for_new
        render action: :new, :notice => "An error occured, the type was not saved"
      end
    end

    def edit
      @admin = Administration::Admin.find(params[:id])
      variables_for_edit
    end

    def update
      @admin = Administration::Admin.find(params[:id])

      if @admin.update_attributes(admin_params)
        redirect_to administration.admins_path, notice: 'An admin was successfully updated.'
      else
        variables_for_edit
        render action: :edit, notice: "Update failed, please try again"
      end
    end

    def destroy
      @admin = Administration::Admin.find(params[:id])
    
      unless @admin.destroy
        redirect_to(administration.admins_path, notice: "An error occured, the deletion was not successful")
      else
        redirect_to(administration.admins_path, notice: "An admin's account was deleted")
      end
    end

    private
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :password)
    end

    # these variables are required whenever the new view is rendered
    def variables_for_new
      @path = administration.admins_path
      @method = :post
    end

    # these variables are required whenever the edit view is rendered
    def variables_for_edit
      @path = administration.admin_path
      @method = :patch
    end
  end
end
