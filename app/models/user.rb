class User < ActiveRecord::Base
  has_many :appliances
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def applicances_count
    appliances.count
  end

  def full_name
    first_name + ' ' + last_name
  end
end
