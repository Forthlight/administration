module Administration
  class Blog
    include Mongoid::Document
    include Mongoid::Timestamps

    embeds_many :blog_comments, :class_name => "Administration::BlogComment"

    before_save :sanitize_text
    before_update :sanitize_text

    field :title, type: String
    field :content, type: String
    field :author, type: Integer
    field :published, type: Boolean, default: false

    validates_presence_of :title, :content
    validates :title, length: {maximum: 255}

    def sanitize_text
      self[:content] = CommonDomain::InputSanitizer.new.sanitize_this(self[:content])
    end
  end
end