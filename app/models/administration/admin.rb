module Administration
  class Admin < ActiveRecord::Base
    # Virtual attribute for email or username while signing in
    attr_accessor :login

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :rememberable, :trackable, :validatable

    # Non-devise field validaitons
    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name, presence: true, length: { maximum: 20 }
    validates :username, presence: true, length: { maximum: 20 }, uniqueness: {case_sensitive: false}, format: { with: /\A[a-zA-Z0-9]+\Z/ }

    # Override devise method to allow username and email sign in
    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
  end
end
