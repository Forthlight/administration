module Administration
  class Admin < ActiveRecord::Base
    # Virtual attribute for email or username while signing in
    attr_accessor :email

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]

    # Non-devise field validaitons
    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name, presence: true, length: { maximum: 20 }
    validates :username, presence: true, length: { maximum: 20 }, uniqueness: {case_sensitive: false}, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  end
end
