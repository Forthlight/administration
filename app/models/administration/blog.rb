module Administration
  class Blog
    include Mongoid::Document
    include Mongoid::Timestamps

    has_many :blog_comments, :class_name => "Administration::Blog_comment"

    field :title, type: String
    field :content, type: String
    field :author, type: String

  end
end