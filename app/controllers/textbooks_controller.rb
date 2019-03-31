class TextbooksController < ApplicationController
    before_action :logged_in?, :login_required
    
    def show
        if params[:course_id]
            #@textbook = Course.find(params[:course_id]).textbooks.find(params[:id])
            @textbook = Textbook.find_by(id: params[:id])
            @course = Course.find_by(id: params[:id])
            
        else
            @textbook = Textbook.find(params[:id])
        end
    end

    def index
        if params[:course_id]
            @textbooks = Course.find(params[:course_id]).textbooks
        else
            @textbooks = Textbook.all
        end
    end

    def new
        if params[:course_id] && !Course.exists?(params[:course_id])
            redirect_to courses_path, alert: "Course not found."
        else
            @textbook = Textbook.new(course_ids: params[:course_id])
        end
    end

    def create
        @course = Course.find_by(id: params[:textbook][:course_id])
        @textbook = Textbook.new(textbook_params)

        if @textbook.save
            redirect_to textbooks_path
        else
            render 'new'
        end
    end

private

    def textbook_params
        params.require(:textbook).permit(:title, :author, :course_ids)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end