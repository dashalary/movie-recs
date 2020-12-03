class Category < ApplicationRecord
    has_many :movies, dependent: :destroy
    has_many :users, through: :movies
    validates :name, presence: true
    
end