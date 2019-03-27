class School < ApplicationRecord
    has_many :courses

    scope :alphabetical, -> { order("name ASC") }

    validates :name, presence: true 
    
end
