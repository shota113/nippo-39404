class DiariesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_diary, only: [:edit, :update, :show, :destroy]
  def index
    @diaries = Diary.order("created_at DESC")
  end

  def new
    @diary = Diary.new
  end

  def show
    @comments = @diary.comments.includes(:user)
    @comment = Comment.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render 'new'
    end
  end

    def edit
      if @diary.user_id == current_user.id
      else
        redirect_to root_path
      end
    end

    def update
      if @diary.update(diary_params)
        redirect_to diary_path(@diary)
      else
         render 'edit'
      end
    end

    def destroy
      @diary.destroy if @diary.user_id == current_user.id

      redirect_to root_path
    end



  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def diary_params
    params.require(:diary).permit(:place, :work, :category_id, :start_time, :ending_time, :image).merge(user_id: current_user.id)
  end
  def set_diary
    @diary = Diary.find(params[:id])
  end
end