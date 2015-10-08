class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.references :user
      t.string :country
      t.string :state
      t.string :title
      t.string :subtitle
      t.jsonb  :meta_data

      t.timestamps null: false
    end
  end
end
