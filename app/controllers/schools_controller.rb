class SchoolsController < ApplicationController
  before_action :logged_in?, :login_required

  def show
    school = School.find_by(id: params[:id])
    if school
      render json: {id: school.id, name: school.name}
    else
      render json: { message: 'Bird not found' }
    end  
  end

  def mycourses
    @school = School.find_by_id(params[:id])
    @courses = @school.courses
    #raise params.inspect
  end

  def index
    schools = School.all.alphabetical
    render json: schools, only: [:id, :name]
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path
    else
      render 'new'
    end
  end

private

  def school_params
    params.require(:school).permit(:name)
  end
end
