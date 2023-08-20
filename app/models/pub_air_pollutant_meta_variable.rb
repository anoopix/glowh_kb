class PubAirPollutantMetaVariable < ApplicationRecord
    belongs_to :publication
    belongs_to :air_pollutant
    belongs_to :meta_variable

    validates_associated :publication
    validates_associated :air_pollutant
    validates_associated :meta_variable

    validates :value, :upper_limit, :lower_limit, presence: true
end