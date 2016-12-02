class ContactSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :phone, :address, :problem
end
