class CommentsController < ApplicationController
  def new
    @comment =Comment.new
    @comment.topic_id = params[:topic_id]
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger]= 'コメントに失敗しました'
      render root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :topic_id)
  end
end
