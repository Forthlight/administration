module Administration
  class BlogComment
    include Mongoid::Document
    include Mongoid::Timestamps

   	embedded_in :blog, inverse_of: :blog_comments, class_name: "Administration::Blog"

    before_save :sanitize_text
    before_update :sanitize_text
    
    field :author, type: Integer
    field :content, type: String
    field :admin, type: Boolean

    validates :content, presence: true

    def sanitize_text
      self[:content] = CommonDomain::InputSanitizer.new.sanitize_this(self[:content])
    end
  end
end