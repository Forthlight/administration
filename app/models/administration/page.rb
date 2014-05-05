module Administration
  class Page
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title, type: String
    field :content, type: String


    def sanitize_text
      self[:content] = CommonDomain::InputSanitizer.new.sanitize_this(self[:content])
    end
  end
end