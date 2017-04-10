class AddColumnStateToServices < ActiveRecord::Migration
  def change
    add_column :services, :state, :string, default: "in_draft"
  end
end
