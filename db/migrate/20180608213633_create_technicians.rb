class CreateTechnicians < ActiveRecord::Migration
  def change
    create_table :technicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
