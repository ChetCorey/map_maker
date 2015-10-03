class AddReferences < ActiveRecord::Migration
  def change
    add_reference :projects, :user, index: true, foreign_key: true
    add_reference :maps, :project, index: true, foreign_key: true
  end
end
