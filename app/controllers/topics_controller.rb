class TopicsController < ApplicationController
  skip_before_filter :authorize, :only => [:index]

  @@topic_id = 1

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    
    @topic = Topic.find(params[:id])
    begin
      @relation = TopicsUser.find_by_topic_id_and_user_id params[:id], session[:user_id]
    rescue ActiveRecord::RecordNotFound
      puts "Relation not found"
      nil
    end
    begin
      # Fetch topic related resources
      #@resource_array = Resource.find_all_by_topic_id @topic.id
      @resource_array = Resource.paginate(
          :conditions => "topic_id = #{@topic.id}",
          :per_page => 20,
          :page => params[:page],
          :order => 'up_count DESC, created_at DESC, add_count DESC, down_count ASC'
      )
    rescue ActiveRecord::RecordNotFound
      nil
    end

    respond_to do |format|
      format.html {
        if request.xhr?
          render :partial => "topic_resources_all", :collection => @resource_array
        end
      }
      format.json { render json: @topic }
    end
  end

  # Split results in tab --- status
  def show_topic_status
    
    @topic = Topic.find(params[:id])
    begin
      # Fetch topic related resources
      #@resource_array = Resource.find_all_by_topic_id @topic.id
      @resource_array_status = Resource.paginate(
          :conditions => "topic_id = #{@topic.id} && type_id = 'status'",
          :per_page => 10,
          :page => params[:page],
          :order => 'up_count DESC, created_at DESC, add_count DESC, down_count ASC'
      )
    rescue ActiveRecord::RecordNotFound
      nil
    end

    respond_to do |format|
      format.html {
        if request.xhr?
          render :partial => "topic_resources_status", :collection => @resource_array_status
        end
      }
      format.json { render json: @topic }
    end
  end

  # Split results in tab --- links
  def show_topic_links
    
    @topic = Topic.find(params[:id])
    begin
      # Fetch topic related resources
      #@resource_array = Resource.find_all_by_topic_id @topic.id
      @resource_array_links = Resource.paginate(
          :conditions => "topic_id = #{@topic.id} && type_id = 'link'",
          :per_page => 10,
          :page => params[:page],
          :order => 'up_count DESC, created_at DESC, add_count DESC, down_count ASC'
      )
    rescue ActiveRecord::RecordNotFound
      nil
    end

    respond_to do |format|
      format.html {
        if request.xhr?
          render :partial => "topic_resources_links", :collection => @resource_array_links
        end
      }
      format.json { render json: @topic }
    end
  end

  # Split results in tab --- videos
  def show_topic_videos
    
    @topic = Topic.find(params[:id])
    begin
      # Fetch topic related resources
      #@resource_array = Resource.find_all_by_topic_id @topic.id
      @resource_array_videos = Resource.paginate(
          :conditions => "topic_id = #{@topic.id} && type_id = 'video'",
          :per_page => 10,
          :page => params[:page],
          :order => 'up_count DESC, created_at DESC, add_count DESC, down_count ASC'
      )
    rescue ActiveRecord::RecordNotFound
      nil
    end

    respond_to do |format|
      format.html {
        if request.xhr?
          render :partial => "topic_resources_videos", :collection => @resource_array_videos
        end
      }
      format.json { render json: @topic }
    end
  end

  # Split results in tab --- books
  def show_topic_books
    
    @topic = Topic.find(params[:id])
    begin
      # Fetch topic related resources
      @resource_array_books = Resource.paginate(
          :conditions => "topic_id = #{@topic.id} && type_id = 'book'",
          :per_page => 10,
          :page => params[:page],
          :order => 'up_count DESC, created_at DESC, add_count DESC, down_count ASC'
      )
    rescue ActiveRecord::RecordNotFound
      nil
    end

    respond_to do |format|
      format.html {
        if request.xhr?
          render :partial => "topic_resources_books", :collection => @resource_array_books
        end
      }
      format.json { render json: @topic }
    end
  end
  
  # Splic results in tab --- Mine
  def show_topic_mine
    
    @topic = Topic.find(params[:id])
    begin
      # Fetch topic related resources
      @resource_array_mine = Resource.paginate(
          :conditions => "topic_id = #{@topic.id} && user_id = #{session[:user_id]}",
          :per_page => 10,
          :page => params[:page],
          :order => 'up_count DESC, created_at DESC, add_count DESC, down_count ASC'
      )
    rescue ActiveRecord::RecordNotFound
      nil
    end
    
    respond_to do |format|
      format.html {
        if request.xhr?
          render :partial => "topic_resources_all", :collection => @resource_array_mine
        end
      }
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])
    
    if (params[:keywordForAdd]!=nil && params[:keywordForAdd]!="")
      @topic.title = params[:keywordForAdd]
    end

    respond_to do |format|
      if @topic.save
        TopicsUser.create!(:topic_id=>@topic.id, :user_id=>session[:user_id])
        format.html { redirect_to @topic, notice: 'Topic was successfully created and added to your list.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
  
  def score    
    # Find topic by id
    begin
      @topic = Topic.find_by_id(params[:topic_id])
    rescue
      @topic = nil
    end
    
    # Find correspondent record in TopicResourceUser table based on user_id and topic_score_id.
    begin
      @topicscoreuser = TopicsUsersAction.find_or_create_by_user_id_and_topic_id(params[:user_id], params[:topic_id])
    rescue
      nil
    end
    
    if @topicscoreuser.user_action == 0
      if params[:user_action].to_i == 2 # User click on up
        @topicscoreuser.user_action = 2
        @topic.up_count += 1
      else # User click on down
        @topicscoreuser.user_action = 3
        @topic.down_count += 1
      end
      
      @topicscoreuser.save!
      @topic.save!
    end
    
    redirect_to :back
  end
end
