class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    comment = @event.comments.build(params[:comment])
    comment.user = current_user
 
    if comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to event_path(@event)
    else
      flash[:notice] = 'The comment you typed was invalid.'
      render "events/show"
    end
  end
 
  def destroy
    event = Event.find([params[:event_id]])
    comment = Comment.find(params[:id])
    comment.delete
    flash[:notice] = "Delete"
    redirect_to event_path(event)
  end
end