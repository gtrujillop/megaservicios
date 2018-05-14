class User < ActiveRecord::Base
  has_many :appliances
  has_one :user_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  validates :email, uniqueness: true
  
  scope :latest, ->{ order("created_at DESC") }

  ADMIN_ROLE = 'Administrator'.freeze
  
  def applicances_count
    appliances.count
  end

  def full_name
    first_name + ' ' + last_name
  end

  def self.search(search)
    where("first_name || ' ' || last_name LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR phone LIKE ? OR address LIKE ? OR email LIKE ?",
      "%#{search}", "%#{search}", "%#{search}", "%#{search}", "%#{search}", "%#{search}")
  end

  def is_admin?
    return false unless user_role
    user_role&.name == ADMIN_ROLE
  end
end