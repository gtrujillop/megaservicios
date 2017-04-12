class Contact < ActiveRecord::Base
  include AASM
  scope :latest, ->{ order("created_at DESC") }
  
  aasm column: "state" do
    state :in_draft, initial: true
    state :revised
    
    event :revise do
      transitions from: :in_draft, to: :revised
    end
    
    event :unrevise do
      transitions from: :revised, to: :in_draft
    end
  end
end
