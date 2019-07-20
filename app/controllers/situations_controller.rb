class SituationsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @situations = Situation.includes(:metaphors).order("created_at DESC").page(params[:page]).per(5)
  end

  def new

  end

  def create
    Situation.create(situation_params)
  end

  private
  def situation_params
    params.permit( :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
