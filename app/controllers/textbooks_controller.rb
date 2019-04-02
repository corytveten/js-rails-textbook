class TextbooksController < ApplicationController
    before_action :logged_in?, :login_required
    
    def show
        if params[:course_id]
            @textbook = Course.find(params[:course_id]).textbooks.find(params[:id])
            #@textbook = Textbook.find(params[:id])
            #@course = Course.find(params[:course_id])
        else
            @textbook = Textbook.find(params[:id])
        end
    end

    def index
        if params[:course_id]
            @textbooks = Course.find(params[:course_id]).textbooks
            @course = Course.find(params[:course_id])
        else
            @textbooks = Textbook.all.alphabetical
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
            redirect_to textbook_path(@textbook)
        else
            render 'new'
        end
    end

    def edit
        @textbook = Textbook.find(params[:id])
    end

    def update
		@textbook = Textbook.find_by(id: params[:id])
		@textbook.update(textbook_params)
		redirect_to textbook_path(@textbook)
	end

private

    def textbook_params
        params.require(:textbook).permit(:title, :author, :course_ids)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end