class TextbooksController < ApplicationController
    before_action :require_login

    def show
        @course = Course.find(params[:course_id]).textbooks
        @textbook = Textbook.find(params[:id])
    end

    def index
        if params[:course_id]
            @textbooks = Course.find(params[:course_id]).textbooks
        else
            @textbooks = Textbook.all
        end
    end

    def new
        @textbook = Textbook.new
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