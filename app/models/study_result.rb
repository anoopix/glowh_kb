class StudyResult < ApplicationRecord
    belongs_to :publication

    validates_associated :publication

    validates :outcome, presence: true
end