class GeographicLocation < ApplicationRecord
    validates :location_in_publication, :country, :continent, presence: true

    has_many :pub_geographic_location
end