module Administration
  module BlogsHelper
    def find_comment_author(id)
      user = Member::User.find(id)
      user.username
    end
  end
end
