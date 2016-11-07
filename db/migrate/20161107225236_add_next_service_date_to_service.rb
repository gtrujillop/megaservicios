class AddNextServiceDateToService < ActiveRecord::Migration
  def change
    add_column :services, :next_service_date, :date
  end
end
