class Textbook < ApplicationRecord
    has_many :course_textbooks
    has_many :courses, through: :course_textbooks

    validates :title, presence: true
    validates :author, presence: true

end
