class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :fips
      t.string :name
      t.string :value
      t.references :user, index: true, foreign_key: true
      t.references :study, index: true, foreign_key: true
      t.references :map, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
