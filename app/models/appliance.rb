class Appliance < ActiveRecord::Base
  belongs_to :user
  belongs_to :type
  belongs_to :brand
  has_many :services

  validates :model, presence: true, length: { maximum: 75 }

  scope :by_user, -> (user_id) { where("user_id = ?", "#{user_id}") }
  scope :ultimos, ->{ order("created_at DESC") }

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
    if last_service
      last_service.registered_at
    else
      Date.today
    end
  end

  def next_revision_date
    if last_service
      last_service.next_service_date
    else
      Date.today
    end
  end
end
