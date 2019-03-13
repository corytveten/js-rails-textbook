class CoursesController < ApplicationController
    def show
        @course = Course.find(params[:id])
    end

    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        @course.save
        redirect_to courses_path
     end

    private

    def course_params
        params.require(:course).permit(:title, :code)
    end
end
