module Administration
  class Blog_comment
    include Mongoid::Document
    include Mongoid::Timestamps

   	belongs_to :blog, :class_name => "Administration::Blog"

    field :author, type: String
    field :content, type: String
  end
end