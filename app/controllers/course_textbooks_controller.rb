class CourseTextbooksController < ApplicationController
before_action :logged_in?, :login_required

    def edit
        @course_textbook = CourseTextbook.find_by(id: params[:id])
        @course = Course.find_by(id: params[:course_id])
        @textbook = Textbook.find_by(id: params[:textbook_id])
        @course_textbook.textbook_id = @textbook.id
        @course_textbook.course_id = @course.id
        
    end

    def update
        @course = Course.find_by(id: params[:course_id])
        @textbook = Textbook.find_by(id: params[:textbook_id])
        @course_textbook = CourseTextbook.create(course_textbook_params)
        @course_textbook.textbook_id = @textbook.id
        @course_textbook.course_id = @course.id
        raise params.inspect
        if @course_textbook.save
            redirect_to course_path(@course)
        else
            render 'new'
        end
    end

    def new
        @course_textbook = CourseTextbook.new
        @course = Course.find_by(id: params[:course_id])
        @textbook = Textbook.find_by(id: params[:textbook_id])
        @course_textbook.textbook_id = @textbook.id
        @course_textbook.course_id = @course.id
        
    end

    def create
        @course = Course.find_by(id: params[:course_id])
        @textbook = Textbook.find_by(id: params[:textbook_id])
        @course_textbook = CourseTextbook.create(course_textbook_params)
        @course_textbook.textbook_id = @textbook.id
        @course_textbook.course_id = @course.id
        #raise params.inspect
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