class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:role_ids,:name, :image
    validates :email, :presence => true
  mount_uploader :image, ImageUploader


 
   has_and_belongs_to_many :roles
    def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  # attr_accessible :title, :body
end
