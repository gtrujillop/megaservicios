class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.date :registered_at
      t.references :appliance, index: true, foreign_key: true
      t.decimal :cost
      t.text :comments

      t.timestamps null: false
    end
  end
end
