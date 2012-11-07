class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  skip_before_filter :authorize, :only => [:invite, :reset, :new, :create]

  def index
    @users = User.order(:created_at)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def invite
    begin
      @user = User.find_by_email(params[:invite])
      rescue ActiveRecord::RecordNotFound
      @user = nil
    end

    if @user && !@user.is_registered
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      @user.update_attributes(:is_registered => true)
      @user.save!
      Notifier.registration_succeed(@user).deliver
    else
      @user = nil
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
      @user = User.find(session[:user_id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.screen_name = "a real user"
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        session[:user_email] = @user.email
        format.html { redirect_to home_feeds_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
        Notifier.registration_succeed(@user).deliver
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        # Update user information after setting changed. Added by Brandon. 2012/03/07.
        @user = User.find(params[:id])
        session[:user_id] = @user.id
        session[:user_email] = @user.email
        session[:screen_name] = @user.screen_name
        
        format.html { redirect_to home_feeds_path, notice: 'You information has been updated sucessfully.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def reset
      @user = User.find_by_email_and_hashed_password(params[:email],params[:hash])
      if(@user)
        session[:user_id] = @user.id
        respond_to do |format|
          format.html { redirect_to edit_user_url(@user.id), notice: 'You may update your new password here!' }
        end

        
      else

      end  
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
