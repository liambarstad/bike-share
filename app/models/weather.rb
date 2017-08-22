class Weather < ActiveRecord::Base
  belongs_to :date
  belongs_to :zip_code

  validates :date_id,
  :max_temperature, :mean_temperature,
  :min_temperature, :mean_humidity,
  :mean_visibility, :mean_wind_speed,
  :precipitation, :zip_code_id,
  presence: true

  def find_thirty_conditions(start_index)
    find_range = (start_index...(start_index + 30)).to_a
    find(find_range)
  end

  def self.reset_ids
    connection.reset_pk_sequence!('weathers')
  end
end
