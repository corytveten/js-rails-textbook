class SchoolsController < ApplicationController
  def show
    @school = School.find(params[:id])
  end

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    school = School.create(school_params)
    redirect_to school
  end

private

  def school_params
    params.require(:school).permit(:title)
  end
end
