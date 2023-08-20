class AirPollutant < ApplicationRecord
    validates :full_name, presence: true

    has_many :pub_air_pollutant_meta_variables
end