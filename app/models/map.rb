class Map < ActiveRecord::Base
  belongs_to :user
  belongs_to :study
  has_many :records
end
