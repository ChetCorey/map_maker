class AddRefenceToMaps < ActiveRecord::Migration
  def change
    add_reference :maps, :study, index: true, foreign_key: true
  end
end
