class TopicsUsersController < ApplicationController
  # GET /topics_users
  # GET /topics_users.json
  def index
    @topics_users = TopicsUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics_users }
    end
  end

  # GET /topics_users/1
  # GET /topics_users/1.json
  def show
    @topics_user = TopicsUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topics_user }
    end
  end

  # GET /topics_users/new
  # GET /topics_users/new.json
  def new
    @topics_user = TopicsUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topics_user }
    end
  end

  # GET /topics_users/1/edit
  def edit
    @topics_user = TopicsUser.find(params[:id])
  end

  # POST /topics_users
  # POST /topics_users.json
  def create
    @topics_user = TopicsUser.new(:topic_id=>params[:topic_id], :user_id=>params[:user_id])
    respond_to do |format|
      if @topics_user.save
        format.html { redirect_to find_topics_url, notice: 'Topic successfully added.' }
        format.json { render json: @topics_user, status: :created, location: @topics_user }
      else
        format.html { render action: "new" }
        format.json { render json: @topics_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics_users/1
  # PUT /topics_users/1.json
  def update
    @topics_user = TopicsUser.find(params[:id])

    respond_to do |format|
      if @topics_user.update_attributes(params[:topics_user])
        format.html { redirect_to @topics_user, notice: 'Topics user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topics_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics_users/1
  # DELETE /topics_users/1.json
  def destroy
    @topics_user = TopicsUser.find(params[:id])
    @topics_user.destroy

    respond_to do |format|
      format.html { redirect_to my_topics_url, notice: 'Remove topic succeed!' }
      format.json { head :no_content }
    end
  end
 
end
