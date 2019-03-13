class CourseTextbook < ActiveRecord::Base
    belongs_to :course
    belongs_to :textbook
  end