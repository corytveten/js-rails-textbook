class AddCommentToCourseTextbooks < ActiveRecord::Migration[5.2]
    def change
      add_column :course_textbooks, :comment, :string
    end
  end