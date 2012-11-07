RealThematics::Application.routes.draw do

  resources :topics_users


  # Prevent user from visiting users page. Modified by Brandon. 2012/03/05.
  resources :users, :only => [:create, :new, :edit, :update, :invite]
  resources :topics, :only => [:create, :edit, :update, :show]
  resources :resources, :only => [:create, :edit, :update, :show]

  #
  get "signup/index"
  get "admin/index"
  
  get "signup" => "users#new"
  # 
  controller :sessions do
    get 'login' => :new
    post 'login' => :create 
    delete 'logout' => :destroy
    get 'reset' => :reset
  end
  # 
  get 'admin' => 'admin#index'

  # Modified by Brandon. 2012/02/23.
  get "findtopics" => "find_topics#index", :as => 'find_topics'
  get "findtopics/search" => "find_topics#search", :as => 'search_topics'
  get "mytopics" => "my_topics#index", :as => 'my_topics'
  get "profile" => "user_profile#index", :as => 'user_profile'
  get "topicsboard" => "home_feeds#index", :as => 'home_feeds'
  get "search_url" => "home_feeds#search_url", :as => 'search_url'
  get "search_book" => "home_feeds#search_book", :as => 'search_book'

  get "invite" => "users#invite"
  get "users/reset" => "users#reset"
  get "update" => "users#edit"
  get "signin" => 'sessions#new'

  match "home_resources", :controller => "home_feeds", :action => "index"
  match "topic_resources_all", :controller => "topics", :action => "show"
  match "show_topic_status", :controller => "topics", :action => "show_topic_status"
  match "show_topic_links", :controller => "topics", :action => "show_topic_links"
  match "show_topic_videos", :controller => "topics", :action => "show_topic_videos"
  match "show_topic_books", :controller => "topics", :action => "show_topic_books"
  match "show_topic_mine", :controller => "topics", :action => "show_topic_mine"
  
  match "find_topics_list", :controller => "find_topics", :action => "index"
  match "my_topics_list", :controller => "my_topics", :action => "index"
  
  # Score counts
  match "score", :controller => "topics", :action => "score"
  match "resource_score", :controller => "resources", :action => "score"

  #root :to => 'home_feeds#index', :as => 'home_feeds'
  root :to => 'signup#index', :as => 'mainpage'

  # Redirect every error route to root. Added by Brandon. 2012/03/30
  match '*a', :to => 'errors#routing'
end
