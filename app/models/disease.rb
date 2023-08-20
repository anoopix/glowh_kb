class Disease < ApplicationRecord
    validates :name, presence: true

    has_many :pub_diseases
end