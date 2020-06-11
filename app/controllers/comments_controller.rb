class CommentsController < ApplicationController
    def create
        @comment = Comment.new
    end

    private
    def comment_param
        params.require(:comment).permit(:content)
    end
end
