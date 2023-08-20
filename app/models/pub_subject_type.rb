class PubSubjectType < ApplicationRecord
    belongs_to :publication
    belongs_to :subject_type

    validates_associated :publication
    validates_associated :subject_type
end