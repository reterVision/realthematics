class MyTopicsController < ApplicationController
  before_filter :authorize
  def index
    @user = current_user
    #@myTopics = TopicsUser.find_all_by_user_id(@user.id)
    
    begin
      @myTopics = TopicsUser.paginate(
          :conditions => ["user_id = ?", @user.id],
          :select => "topics_users.id, topics_users.topic_id, topics_users.user_id, topics_users.created_at, topics_users.updated_at, topics.up_count, topics.down_count",
          :joins => "LEFT OUTER JOIN topics ON topics.id = topics_users.topic_id",
          :per_page => 30,
          :page => params[:page]
      )
    rescue ActiveRecord::RecordNotFound
      @myTopics = nil
    end
    
    respond_to do |format|
      format.html {
        if request.xhr?
          render :partial => "my_topics_list", :collection => @myTopics
        end
      }
    end    
  end
  
  def add
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
