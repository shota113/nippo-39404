class DiariesController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @diaries = Diary.order("created_at DESC")
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def diary_params
    params.require(:diary).permit(:place, :work, :category_id, :start_time, :ending_time, :image).merge(user_id: current_user.id)
  end
end