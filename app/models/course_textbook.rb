class CourseTextbook < ApplicationRecord
    belongs_to :course
    belongs_to :textbook
  end