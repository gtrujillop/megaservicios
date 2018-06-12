class Service < ActiveRecord::Base
  include AASM
  belongs_to :appliance
  belongs_to :technician

  scope :latest, -> { order("created_at DESC") }
  scope :by_user, -> (user_id) { joins(:appliance)
                               .where('appliances.user_id = ?', "#{user_id}") }
  scope :planned_for_date, -> (date) { where(next_service_date: date).includes(appliance: :user) }

  aasm column: "state" do
    state :in_draft, initial: true
    state :completed
    
    event :complete do
      transitions from: :in_draft, to: :completed
    end
    
    event :uncomplete do
      transitions from: :completed, to: :in_draft
    end
    
  end
  
  def appliance_model
    appliance.model
  end

  def appliance_type
    appliance.type_name
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

  def technician_name
    technician.full_name
  end
end
