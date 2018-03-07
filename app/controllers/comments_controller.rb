class CommentsController < ApplicationController

  before_action :set_ticket
  before_action :require_signin

  def create
    @comment = @ticket.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save(comment_params)
      log_event(@comment, "Created ")
      @ticket.status = @comment.currentstatus
      @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :ticket_id, :currentstatus)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

end
