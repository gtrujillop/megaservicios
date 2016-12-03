class Service < ActiveRecord::Base
  belongs_to :appliance

  scope :ultimos, ->{ order("created_at DESC") }
  scope :by_user, -> (user_id) { joins(:appliance)
                                 .where('appliances.user_id = ?', "#{user_id}") }

  def appliance_model
    appliance.model    #code
  end
end
