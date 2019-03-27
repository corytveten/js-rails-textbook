class Textbook < ApplicationRecord
    has_many :course_textbooks
    has_many :courses, through: :course_textbooks

    validates :title, presence: true
    validates :course_id, presence: true

    def course_code=(code)
        self.courses = Course.find_or_create_by(code: code)
    end

    def course_code
        self.courses ? self.courses.code : nil
    end
end
