class Map < ActiveRecord::Base
  belongs_to :user
  belongs_to :study
  has_many :records

  def self.import(file)
    @meta_data = []
    CSV.foreach(file.path, headers: true) do |row|
      value = row["value"]
      fip = row["fips"]
      county_code = fip.slice!(-3, 3)
      state_code = fip
      @meta_data << {"hc-key":"us-#{state_code}-#{county_code}", "value": value.to_i}
    end

  end
end
