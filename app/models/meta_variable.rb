class MetaVariable < ApplicationRecord
    validates :name, :code, presence: true
end