class CreateCourseTextbooks < ActiveRecord::Migration[5.2]
    def change
      create_table :course_textbooks do |t|
        t.belongs_to :course, index: true, foreign_key: true
        t.belongs_to :textbook, index: true, foreign_key: true
        
        t.timestamps
      end
    end
  end