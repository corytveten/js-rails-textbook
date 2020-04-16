class CoursesController < ApplicationController
    before_action :logged_in?, :login_required

    def show
        @course = Course.find(params[:id])
        @textbooks = Textbook.all
        #raise params.inspect
        
    end

    def index
        if params[:school_id]
            courses = School.find(params[:school_id]).courses
            render json: courses
        else
            courses = Course.all.alphabetical
            render json: courses, only: [:id, :title, :code, :school_id]
        end
    end

    def new
        @course = Course.new
    end

    def create
        #@school = School.find_by(id: params[:course][:school_id])
        @course = Course.new(course_params)        
        if @course.save
            redirect_to courses_path
        else 
            render 'new'
        end
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
		@course = Course.find_by(id: params[:id])
		@course.update(course_params)
		redirect_to courses_path(@course)
	end

    private

    def course_params
        params.require(:course).permit(:title, :code, :school_name, :school_id)
    end
end
