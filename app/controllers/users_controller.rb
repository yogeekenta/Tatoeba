class UsersController < ApplicationController
  def show
      @nickname = current_user.nickname
      @metaphors = current_user.metaphors.page(params[:page]).per(5).order("created_at DESC")
  end
end
