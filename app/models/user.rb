class User < ActiveRecord::Base
  has_many :maps
  has_many :projects
  has_many :records
end
