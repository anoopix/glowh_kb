class PubStatisticalMethod < ApplicationRecord
    belongs_to :publication
    belongs_to :statistical_method

    validates_associated :publication
    validates_associated :statistical_method
end