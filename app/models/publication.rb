class Publication < ApplicationRecord
    validates :title, :journal, :url, :published_at, presence: true

    has_many :pub_air_pollutant_meta_variables
    has_many :pub_air_pollutants
    has_many :pub_diseases
    has_many :pub_geographic_locations
    has_many :pub_pollens
    has_many :pub_statistical_methods
    has_many :pub_subject_types
    has_many :pub_weather_relation_codes
    has_many :pub_weathers

    has_many :air_pollutants, through: :pub_air_pollutant_meta_variables
    has_many :meta_variables, through: :pub_air_pollutant_meta_variables
    has_many :diseases, through: :pub_diseases
    has_many :geographic_locations, through: :pub_geographic_locations
    has_many :pollens, through: :pub_pollens
    has_many :statistical_methods, through: :pub_statistical_methods
    has_many :subject_types, through: :pub_subject_types
    has_many :weathers, through: :pub_weather_relation_codes
    has_many :relation_codes, through: :pub_weather_relation_codes
end