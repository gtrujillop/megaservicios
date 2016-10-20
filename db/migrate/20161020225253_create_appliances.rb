class CreateAppliances < ActiveRecord::Migration
  def change
    create_table :appliances do |t|
      t.string :model
      t.references :user, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
