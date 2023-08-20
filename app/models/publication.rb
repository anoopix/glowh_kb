class Publication < ApplicationRecord
    validates :title, :journal, :url, :published_at, presence: true
end