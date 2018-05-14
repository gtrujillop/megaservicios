class User < ActiveRecord::Base
  has_many :appliances
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  validates :email, uniqueness: true

  
  scope :latest, ->{ order("created_at DESC") }
  
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

  # TODO Add roles and user_roles.
  # Only user for now will be David Lopez
  def is_admin?
    true
  end
end