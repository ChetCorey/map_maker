class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :state_code
      t.string :state_fips_code
      t.string :county_fips_code
      t.string :fips
      t.string :ansi_code
      t.string :gu_name
      t.string :gu_size

      t.timestamps null: false
    end
  end
end
