class AddColumnStateToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :state, :string
  end
end
