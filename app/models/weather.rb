class Weather < ApplicationRecord
    validates :primary, :secondary, presence: true

    has_many :pub_weather_relation_code
    has_many :pub_weather
end