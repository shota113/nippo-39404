class CommentChannel < ApplicationCable::Channel
  def subscribed
    @diary = Diary.find(params[:diary_id])
    stream_for @diary
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
