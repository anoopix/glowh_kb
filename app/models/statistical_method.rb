class StatisticalMethod < ApplicationRecord
    validates :name, presence: true

    has_many :pub_statistical_method
end