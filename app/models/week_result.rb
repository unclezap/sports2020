class WeekResult < ApplicationRecord
    belongs_to :batch
    has_many :scores
end
