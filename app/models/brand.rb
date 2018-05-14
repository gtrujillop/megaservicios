class Brand < ActiveRecord::Base
  has_many :appliances
  validates_uniqueness_of :name
  validates_presence_of :name
end
