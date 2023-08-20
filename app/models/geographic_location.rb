class GeographicLocation < ApplicationRecord
    validates :location_in_publication, :country, :continent, presence: true
end