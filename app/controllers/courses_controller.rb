class CoursesController < ApplicationController
    def show
        @course = Course.find(params[:id])
    end

    def index
        if params[:school_id]
            @courses = School.find(params[:school_id]).courses
        else
            @courses = Course.all
        end
    end

    def new
        @course = Course.new
    end

    def create
        @school = School.find_by(id: params[:course][:school_id])
        @course = Course.new(course_params)        
        if @course.save
            redirect_to courses_path
        else 
            render 'new'
        end
    end

    private

    def course_params
        params.require(:course).permit(:title, :code, :school_name)
    end
end
