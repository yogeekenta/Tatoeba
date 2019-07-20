class MetaphorsController < ApplicationController
    before_action :set_situation
    before_action :move_to_index, except: :index
    layout 'metaphors'

  def index
    @situation = Situation.find(params[:situation_id])
    @metaphors = @situation.metaphors.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Metaphor.create(image: params[:image], text: params[:text], situation_id: @situation.id, user_id: current_user.id)
  end

  def destroy
      metaphor = Metaphor.find(params[:id])
      if metaphor.user_id == current_user.id
        metaphor.destroy
      end
  end

  def edit
    @metaphor = Metaphor.find(params[:id])
  end

  def update
      metaphor = Metaphor.find(params[:id])
      if metaphor.user_id == current_user.id
        metaphor.update(metaphor_params)
      end
  end

  private
  def metaphor_params
    params.permit(:image, :text)
  end

  def set_situation
    @situation = Situation.find(params[:situation_id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end


# def create
#       Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
#     end

#     private
#     def tweet_params
#       params.permit(:name, :image, :text)
#     end
