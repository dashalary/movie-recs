class Movie < ApplicationRecord
    belongs_to :user
    belongs_to :category
    scope :seen, -> { where(seen: true) }
end