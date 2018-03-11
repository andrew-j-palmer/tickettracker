class TicketsController < ApplicationController
  before_action :require_signin


  def index
    @tickets = Ticket.all
  end

  def resolved
    @tickets = Ticket.where(status: "Resolved")
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      log_event(@ticket, "Updated ")
      redirect_to @ticket, notice: "Sucessfully Updated."
    else
      render :edit
    end
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      log_event(@ticket, "Created ")
      redirect_to @ticket, notice: "Ticket created."
    else
      render :new
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    log_event(@ticket, "Deleted ")
    if @ticket.destroy
      redirect_to tickets_path, alert: "Ticket deleted."
    end
  end

private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :assigned_user, :screenshot)
  end

end
