class Pollen < ApplicationRecord
    validates :pollen_type, presence: true
end