class AddColumnsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :cellphone, :string
    add_column :contacts, :municipality, :string
    add_column :contacts, :neighborhood, :string
    add_column :contacts, :appliance, :string
    add_column :contacts, :brand, :string
    add_column :contacts, :apartment, :string
    add_column :contacts, :urbanization, :string
  end
end