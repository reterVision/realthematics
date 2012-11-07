require 'test_helper'

class TopicsUsersControllerTest < ActionController::TestCase
  setup do
    @topics_user = topics_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topics_user" do
    assert_difference('TopicsUser.count') do
      post :create, topics_user: @topics_user.attributes
    end

    assert_redirected_to topics_user_path(assigns(:topics_user))
  end

  test "should show topics_user" do
    get :show, id: @topics_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @topics_user
    assert_response :success
  end

  test "should update topics_user" do
    put :update, id: @topics_user, topics_user: @topics_user.attributes
    assert_redirected_to topics_user_path(assigns(:topics_user))
  end

  test "should destroy topics_user" do
    assert_difference('TopicsUser.count', -1) do
      delete :destroy, id: @topics_user
    end

    assert_redirected_to topics_users_path
  end
end
