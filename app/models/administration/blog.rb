module Administration
  class Blog
    include Mongoid::Document
    include Mongoid::Timestamps

    embeds_many :blog_comments, :class_name => "Administration::BlogComment"

    field :title, type: String
    field :content, type: String
    field :author, type: Integer
  end
end