class TextbooksController < ApplicationController

    def show
        @textbook = Textbook.find(params[:id])
    end

    def index
        @textbooks = Textbook.all
    end

    def new
        @textbook = Textbook.new
    end

    def create
        @textbook = Textbook.new(textbook_params)

        if @textbook.save
            redirect_to textbooks_path
        else
            render 'new'
        end
    end

private

    def textbook_params
        params.require(:textbook).permit(:title, :author)
    end

end