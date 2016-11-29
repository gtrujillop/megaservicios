class Service < ActiveRecord::Base
  belongs_to :appliance

  scope :by_user, -> (user_id) { joins(:appliance)
                                 .where('appliances.user_id = ?', "#{user_id}") }
  scope :planned_for_date, -> (date) { where(next_service_date: date).
                                       includes(appliance: :user) }

  def appliance_model
    appliance.model
  end

  def appliance_type
    appliance.type
  end

  def appliance_brand_name
    appliance.brand_name
  end

  def user_name
    appliance.user_name
  end

  def user_address
    appliance.user_address
  end

  def user_phone
    appliance.user_phone
  end
end
