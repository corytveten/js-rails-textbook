class CourseTextbooksController < ApplicationController
before_action :logged_in?, :login_required

    def new
        @course_textbook = CourseTextbook.new
        @course = Course.find_by(id: params[:course_id])
        @textbook = Textbook.find_by(id: params[:textbook_id])
        @course_textbook.textbook_id = @textbook.id
        @course_textbook.course_id = @course.id
        require params.inspect
    end

    def create
        @textbook = Textbook.find_by(id: params[:textbook_id])
        @course = Course.find_by(id: params[:course_id])
        
        @course_textbook = @textbook.course_textbooks.new(course_textbook_params)
        if @course_textbook.save
            redirect_to course_path(@course)
        else
            render 'new'
        end
    end

    private

    def course_textbook_params
        params.require(:course_textbook).permit(:course_id, :textbook_id, :comment)
    end

end