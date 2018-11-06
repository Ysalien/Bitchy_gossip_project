class GossipsController < ApplicationController

  def index
    @gossip = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create!(user_id: session[:user_id], content: params[:gossip][:content], title: params[:gossip][:title])
    flash[:success] = "Created !"
    redirect_to "/gossips"
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
    redirect_to "/gossips"
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content, :user_id)
    @gossip.update(gossip_params)
    flash[:success] = "Updated !"
    redirect_to "/users/#{session[:user_id]}/gossips/"
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.delete
    flash[:danger] = "Deleted"
    redirect_to "/gossips"
  end

end
