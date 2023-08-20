class Pollen < ApplicationRecord
    validates :pollen_type, presence: true

    has_many :pub_pollen
end