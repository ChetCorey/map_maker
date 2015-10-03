class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :study
  belongs_to :map

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Record.create! row.to_hash
    end
  end
end
