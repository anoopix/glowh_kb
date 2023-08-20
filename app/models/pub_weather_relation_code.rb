class PubWeatherRelationCode < ApplicationRecord
    belongs_to :publication
    belongs_to :weather
    belongs_to :relation_code

    validates_associated :publication
    validates_associated :weather
    validates_associated :relation_code
end