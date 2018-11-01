class LikesController < ApplicationController
  before_action :find_gossip
  before_action :find_like, only: [:destroy]

  def new
    @like = Like.new
    if  Like.find_by(user_id: session[:user_id])
     destroy
    else
      create
    end
  end

  def create
    Like.create!(user_id: session[:user_id], likeable_id: params[:gossip_id], likeable_type: "Gossip")
    #@gossip.likes.create(user_id: current_user.id)
    redirect_to gossip_path
  end

  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def destroy
    if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
    @like.destroy
  end
  redirect_to gossip_path(@gossip)
  end

  def find_like
   @like = @gossip.likes.find(params[:id])
  end

end
