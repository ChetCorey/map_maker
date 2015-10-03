class Study < ActiveRecord::Base
  belongs_to :project
  has_many :records
end
