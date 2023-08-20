class StudyPeriod < ApplicationRecord
    belongs_to :publication

    validates_associated :publication

    validates :start_year, :end_year, presence: true
end