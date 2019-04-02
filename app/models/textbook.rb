class Textbook < ApplicationRecord
    has_many :course_textbooks
    has_many :courses, through: :course_textbooks

    scope :alphabetical, -> { order("title ASC") }

    validates :title, presence: true
    validates :author, presence: true
    validates :courses, presence: true

end
