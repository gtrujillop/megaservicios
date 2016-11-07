class Appliance < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  belongs_to :brand
  has_many :services

  def brand_name
    brand.name
  end

  def type_name
    type.name
  end

  def user_name
    user.full_name
  end

  def last_service
    @last_service ||= services.last
  end

  def last_revision_date
    last_service.registered_at
  end

  def next_revision_date
    last_service.next_service_date
  end
end
