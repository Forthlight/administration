module Administration
  class Page
    include Mongoid::Document
    include Mongoid::Timestamps

    before_save :sanitize_text
    before_update :sanitize_text
	
    field :title, type: String
    field :content, type: String
    field :main, type: Boolean, default: false

    validates_presence_of :title, :content
    validates :title, length: {maximum: 255}
    validate :allowed_main?

    def allowed_main?
      if self[:main] == true && Page.where(main: true).count >= 3
        errors.add(:main, 'menu items has reached the limit of 3')
      end
    end

    def sanitize_text
      self[:content] = CommonDomain::InputSanitizer.new.sanitize_this(self[:content])
    end
  end
end