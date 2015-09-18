class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title
      t.string :country
      t.string :state
      t.string :county

      t.timestamps null: false
    end
  end
end
