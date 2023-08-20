class PubGeographicLocation < ApplicationRecord
    belongs_to :publication
    belongs_to :geographic_location

    validates_associated :publication
    validates_associated :geographic_location
end