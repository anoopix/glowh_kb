class MetaVariable < ApplicationRecord
    validates :name, :code, presence: true

    has_many :pub_air_pollutant_meta_variables
end