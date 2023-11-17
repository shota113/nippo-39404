class DiariesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @diaries = Diary.order("created_at DESC")
  end

  def new
    @diary = Diary.new
  end

  def show
    @diary = Diary.find(params[:id])
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
      @diary = Diary.find(params[:id])
      if @diary.user_id == current_user.id
      else
        redirect_to root_path
      end
    end

    def update
      @diary = Diary.find(params[:id])
      if @diary.update(diary_params)
        redirect_to diary_path(@diary)
      else
         render 'edit'
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