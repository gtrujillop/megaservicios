class AddTechnicianRefToServices < ActiveRecord::Migration
  def change
    add_reference :services, :technician, index: true, foreign_key: true
  end
end
