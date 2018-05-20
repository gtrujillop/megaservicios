class UserRole < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name
  validates :user_id, uniqueness: true
end
