class Technician < ActiveRecord::Base
  has_many :services

  scope :latest, ->{ order("created_at DESC") }

  def full_name
    first_name + ' ' + last_name
  end

  def self.search(search)
    search = search.downcase
    where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR phone LIKE ? OR LOWER(email) LIKE ?",
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end