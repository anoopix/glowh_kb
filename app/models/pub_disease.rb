class PubDisease < ApplicationRecord
    belongs_to :publication
    belongs_to :disease

    validates_associated :publication
    validates_associated :disease
end