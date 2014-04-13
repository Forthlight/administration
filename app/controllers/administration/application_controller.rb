module Administration
  class Administration::ApplicationController < ::ApplicationController
    before_filter :authenticate_admin!
  end
end
