class DiariesController < ApplicationController
  before_action :authenticate_user!, expect: [:index]
  def index
  end
end