class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :study
  belongs_to :map

  def self.import(file)
    @meta_data = []
    CSV.foreach(file.path, headers: true) do |row|
      binding.pry

      county_code = fip.slice!(-3, 3)
      state_code = fip
      # "hc-key":"us-nc-001","value":1912
      Record.create! row.to_hash
    end
  end
end
