require 'spec_helper'

module Administration
  describe LandingController do

    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
    end

  end
end
