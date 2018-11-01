class GossipsController < ApplicationController

  def index
    @gossip = Gossip.all
    @user = User.find(params[:user_id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create!(user_id: session[:user_id], content: params[:gossip][:content], title: params[:gossip][:title])
    redirect_to "/users/#{session[:user_id]}/gossips/"
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user= User.find(params[:user_id])
    @comment = Comment.new
    @comment.gossip_id = @gossip.id
  end

  def edit
    @user = User.find(params[:id])
    @gossip = Gossip.find(params[:id])
    redirect_to "/users/#{session[:user_id]}/gossips/"
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content, :user_id)
    @gossip.update(gossip_params)
    redirect_to "/users/#{session[:user_id]}/gossips/"
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.delete
    redirect_to "/users/#{current_user.id}/gossips/"
  end

end
