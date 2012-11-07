class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      session[:user_email] = user.email
      session[:user_screen_name] = user.screen_name
      redirect_to home_feeds_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_email] = nil
    redirect_to login_url, :notice => "Logged out"
  end
  def reset
    user = User.find_by_email(params[:email])
    if(user)
      Notifier.reset_password(user).deliver
      redirect_to login_url, :alert => "Please check your email to reset the password."
    else
      redirect_to login_url, :alert => "This email address hasn't registered yet."
    end
  end
end
