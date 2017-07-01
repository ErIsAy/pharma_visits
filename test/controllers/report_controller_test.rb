require 'test_helper'

class ReportControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get center" do
    get :center
    assert_response :success
  end

  test "should get doctor" do
    get :doctor
    assert_response :success
  end

  test "should get doctor_center" do
    get :doctor_center
    assert_response :success
  end

  test "should get drugstore" do
    get :drugstore
    assert_response :success
  end

  test "should get planning" do
    get :planning
    assert_response :success
  end

end
