class TextbooksController < ApplicationController
    before_action :logged_in?, :login_required
    
    def show
        if params[:course_id]
            @textbook = Course.find(params[:course_id]).textbooks.find(params[:id])
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
        @textbook = Textbook.new(course_id: params[course_id])
    end

    def create
        @course = Course.find_by(id: params[:textbook][:course_id])
        raise params.inspect
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