class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    if params[:resource][:type_id] == "status" || params[:resource][:type_id] == "book"
      begin
        @resource = Resource.find_by_title_and_topic_id(params[:resource][:title], params[:resource][:topic_id])
      rescue
        @resource = nil
      end
    elsif params[:resource][:type_id] == "link" || params[:resource][:type_id] == "video"
      begin
        @resource = Resource.find_by_uri_and_topic_id(params[:resource][:uri], params[:resource][:topic_id])
      rescue
        @resource = nil
      end
    end
    
    if @resource != nil # If resource is added before
      @resource.add_count += 1
    else
      @resource = Resource.new(params[:resource])
    end
    
    respond_to do |format|
      if @resource.save
        format.html { redirect_to :back }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
  
  def score
    # Find topic by id
    begin
      @resource = Resource.find_by_id(params[:resource_id])
    rescue
      @resource = nil
    end
    
    # Find correspondent record in TopicResourceUser table based on user_id and topic_score_id.
    begin
      @resourcescoreuser = ResourcesUsersAction.find_or_create_by_user_id_and_resource_id(params[:user_id], params[:resource_id])
    rescue
      nil
    end
    
    if @resourcescoreuser.user_action == 0
      if params[:user_action].to_i == 2 # User click on up
        @resourcescoreuser.user_action = 2
        @resource.up_count += 1
      else # User click on down
        @resourcescoreuser.user_action = 3
        @resource.down_count += 1
      end
      
      @resourcescoreuser.save!
      @resource.save!
    end
    
    redirect_to :back
  end
end
