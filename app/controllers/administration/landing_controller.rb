require_dependency "administration/application_controller"

module Administration
  class LandingController < ApplicationController
    def index
    	@publications = Article::Publication.limit(8)
    	@members = Member::User.limit(10)
    end
  end
end
