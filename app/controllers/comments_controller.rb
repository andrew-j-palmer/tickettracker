class CommentsController < ApplicationController

  before_action :set_ticket, except: :show
  before_action :require_signin

  def create
    @comment = @ticket.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save(comment_params)
      log_event(@comment, "Created ")
      @ticket.status = @comment.currentstatus
      @ticket.save
      if @comment.currentstatus = "Resolved"
        @message = "Ticket Closed."
      else
        @message = "Successfully Updated."
      end
      redirect_to ticket_path(@ticket), notice: @message
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @comments =  Comment.where(ticket_id: @comment.ticket_id)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.save
      if @comment.currentstatus == "Resolved"
        @message = "Ticket Closed."
      else
        @message = "Successfully Updated."
      end
      log_event(@comment, "Updated ")
      redirect_to :admin, notice: @message
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    log_event(@comment, "Deleted ")
    if @comment.destroy
      redirect_to :admin, alert: "Deletion Logged."
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
