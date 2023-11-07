class DiariesController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end