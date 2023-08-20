class Weather < ApplicationRecord
    validates :primary, :secondary, presence: true
end