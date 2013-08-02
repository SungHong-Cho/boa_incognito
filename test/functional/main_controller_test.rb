require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get clip" do
    get :clip
    assert_response :success
  end

  test "should get event" do
    get :event
    assert_response :success
  end

  test "should get consulting" do
    get :consulting
    assert_response :success
  end

end
