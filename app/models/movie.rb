class Movie < ApplicationRecord
    belongs_to :user
    belongs_to :category
    scope :seen, -> { where(seen: true) }
    accepts_nested_attributes_for :category, :reject_if => :all_blank, :allow_destroy => true
    validates :title, presence: true
    validates :release_year, presence: true 
    validates :category, presence: true
end