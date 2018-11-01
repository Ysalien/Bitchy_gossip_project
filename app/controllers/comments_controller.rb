class CommentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def create
    @comment = Comment.create!(user_id: session[:user_id], gossip_id: @gossip.id, content: params[:comment][:content])
    @comment.gossip_id = params[:gossip_id]
    redirect_to "/users/#{session[:user_id]}/gossips/#{@gossip.id}"
  end

  def edit
    @gossip = Gossip.find(params[:id])
    @comment = Comment.find(params[:id])
  end

 def update
   @comment = Comment.find(params[:id])
   @comment.update(comment_params)
  redirect_to "/users/#{session[:user_id]}/gossips/#{@gossip.id}"
 end

 def destroy
   @comment = Comment.find(params[:id])
   @comment.delete
   redirect_to "/users/#{session[:user_id]}/gossips/#{@gossip.id}"
 end

end
