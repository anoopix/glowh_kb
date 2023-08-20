class AirPollutant < ApplicationRecord
    validates :full_name, presence: true
end