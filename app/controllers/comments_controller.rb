class CommentsController < ApplicationController
    def create
      @log = Log.find(params[:log_id])
      @comment = @log.comments.create(comment_params)
      redirect_to log_path(@log)
    end
  
    def destroy
      @log = Log.find(params[:log_id])
      @comment = @log.comments.find(params[:id])
      @comment.destroy
      redirect_to log_path(@log), status: :see_other
    end
  
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
      end
  end
  