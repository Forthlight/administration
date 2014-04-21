module Administration
  class Admin < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]

    # Non-devise field validations
    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name, presence: true, length: { maximum: 20 }
  end
end
