class Appliance < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  belongs_to :brand
  has_many :services
end
