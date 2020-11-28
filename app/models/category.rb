class Category < ApplicationRecord
    has_many :movies
    has_many :users, through: :movies
    validates :name, presence: true

end