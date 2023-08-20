class RelationCode < ApplicationRecord
    validates :relation, presence: true

    has_many :pub_weather_relation_code
end