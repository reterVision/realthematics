class SignupController < ApplicationController
  skip_before_filter :authorize

  # If user already signed in, don't show inviting list to him.
  def index
    if session[:user_id]
      redirect_to home_feeds_url
    end
  end
end
