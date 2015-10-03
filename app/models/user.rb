class User < ActiveRecord::Base
  has_many :maps
  has_many :projects
end
