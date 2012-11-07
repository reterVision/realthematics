class ApplicationController < ActionController::Base
  layout "application"

  before_filter :authorize
  protect_from_forgery

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to mainpage_url #, :notice => "Please sign in"
    end 
  end

  def current_user
    begin
      User.find_by_id(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
 
