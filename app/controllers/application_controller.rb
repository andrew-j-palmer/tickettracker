class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "PLEASE SIGN IN FIRST."
    end
  end

  def assigned_user_name(ticket)
    User.find(ticket.assigned_user).name
  end

  helper_method :assigned_user_name

  def assigned_tickets(user)
    id = user.id
    Ticket.where(assigned_user: id)
  end

  helper_method :assigned_tickets

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def require_admin
    unless current_user.admin?
      redirect_to root_url, alert: "NOT AUTHORIZED"
    end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

  def prettytime(input)
    input.strftime("%m/%d/%y %l:%M %p")
  end

  helper_method :prettytime

  def all_recent_events
    Event.last(50)
  end

  helper_method :all_recent_events
  
  def return_object_or_false(object, id)
    case object
    when "Ticket"
      @ticket = Ticket.find_by(id: id)
      if @ticket.present?
        @ticket
      end
    when "Comment"
      @comment = Comment.find_by(id: id)
      if @comment.present?
        Ticket.find(@comment.ticket_id)
      end
    when "User"
      @user = User.find_by(id: id)
      if @user.present?
        @user
      end
    end
  end

  helper_method :return_object_or_false

  def interpret_event_object(logged_id, object, action)
    if action != "Deleted "
      return_object_or_false(object, logged_id)
    end
  end

  helper_method :interpret_event_object

  def log_event(e, action)
    @event = Event.new
    @event.action = action
    if e.try(:title)
      @event.object = "Ticket"
      @event.event_id = e.id
    end
    
    if e.try(:body)
      @event.object = "Comment"
      @event.event_id = e.id
    end

    if e.try(:email)
      @event.object = "User"
      @event.event_id = e.id
    end

    @event.user = current_user.id
    @event.save
  end

  helper_method :log_event
end
