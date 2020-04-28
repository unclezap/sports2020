class Batch < ApplicationRecord
    has_many :articles
    has_many :week_results
    # belongs_to :user
end
