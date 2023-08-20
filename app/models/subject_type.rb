class SubjectType < ApplicationRecord
    validates :name, presence: true

    has_many :pub_subject_type
end