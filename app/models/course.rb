class Course < ApplicationRecord
    belongs_to :school
    has_many :course_textbooks
    has_many :textbooks, through: :course_textbooks

    scope :alphabetical, -> { order("code ASC") }

    validates :code, presence: true
    validates :title, presence: true

    def school_name
        self.school ? self.school.name : nil
    end

    def school_name=(name)
        school = School.find_or_create_by(name: name)
        self.school = school
    end

    def course_listing
        self.code + " " + self.title
    end
end
