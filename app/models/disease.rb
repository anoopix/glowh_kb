class Disease < ApplicationRecord
    validates :name, presence: true
end