class Publication < ApplicationRecord
    validates :title, :journal, :url, :published_at, presence: true

    has_many :pub_air_pollutant_meta_variables
end