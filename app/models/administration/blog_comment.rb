module Administration
  class BlogComment
    include Mongoid::Document
    include Mongoid::Timestamps

   	embedded_in :blog, inverse_of: :blog_comments, class_name: "Administration::Blog"

    field :author, type: Integer
    field :content, type: String
    field :admin, type: Boolean

    validates :content, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  end
end