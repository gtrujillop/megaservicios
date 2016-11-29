class Service < ActiveRecord::Base
  belongs_to :appliance

  scope :by_user, -> (user_id) { joins(:appliance)
                                 .where('appliances.user_id = ?', "#{user_id}") }
  scope :planned_for_date, -> (date) { where(next_service_date: date).
                                       includes(appliance: :user) }

  def appliance_model
    appliance.model
  end
end
