class FindTopicsController < ApplicationController
 # skip_before_filter :authorize
  def index
    #@topics = Topic.where("title like ?", "%#{params[:keyword]}%")
    begin
      # Fetch topic related resources
      if(params[:keyword] != nil)
        @topics = Topic.paginate(
            :conditions => ["title LIKE ?", params[:keyword] + '%'],
            :per_page => 30,
            :page => params[:page]
        )
      else
        @topics = Topic.paginate(
            :per_page => 30,
            :page => params[:page]
        )
      end
    rescue ActiveRecord::RecordNotFound
      nil
    end
    
    @topic = Topic.new
    respond_to do |format|
      format.html {
        if request.xhr?
          render :partial => "find_topics_list", :collection => @topics
        end
      }
      format.js
      format.json { render json: @topics }
    end
  end

  def is_topic_in_my_list?(topic)
    TopicsUser.where("topic_id = ? and user_id = ?", topic.id, session[:user_id]).empty? ? false : true
  end
end
