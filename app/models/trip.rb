require "will_paginate"
require "will_paginate/active_record"

class Trip < ActiveRecord::Base
  has_many :stations

  belongs_to :start_date
  belongs_to :end_date
  belongs_to :zip_code
  belongs_to :subscription_type


  validates :duration, presence: true
  validates :start_station, presence: true
  validates :end_station, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true
  validates :start_date_id, presence: true
  validates :end_date_id, presence: true

  def self.find_thirty_trips(number_of_records = 30)
    first(number_of_records)
  end

  def self.sort_trips_by_date
    order(:start_date)
  end
end
