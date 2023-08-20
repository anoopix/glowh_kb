class PubPollen < ApplicationRecord
    belongs_to :publication
    belongs_to :pollen

    validates_associated :publication
    validates_associated :pollen
end