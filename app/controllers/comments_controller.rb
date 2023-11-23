class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @diary = Diary.find(params[:diary_id])
    if @comment.save
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end
end
