class Project < ActiveRecord::Base
  has_many :maps
  belongs_to :user
end
