class PubAirPollutant < ApplicationRecord
    belongs_to :publication
    belongs_to :air_pollutant

    validates_associated :publication
    validates_associated :air_pollutant
end