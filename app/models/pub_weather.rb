class PubWeather < ApplicationRecord
    belongs_to :publication
    belongs_to :weather

    validates_associated :publication
    validates_associated :weather
end