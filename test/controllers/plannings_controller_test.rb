require 'test_helper'

class PlanningsControllerTest < ActionController::TestCase
  setup do
    @planning = plannings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plannings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planning" do
    assert_difference('Planning.count') do
      post :create, planning: { end: @planning.end, note: @planning.note, start: @planning.start, title: @planning.title, visited: @planning.visited }
    end

    assert_redirected_to planning_path(assigns(:planning))
  end

  test "should show planning" do
    get :show, id: @planning
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planning
    assert_response :success
  end

  test "should update planning" do
    patch :update, id: @planning, planning: { end: @planning.end, note: @planning.note, start: @planning.start, title: @planning.title, visited: @planning.visited }
    assert_redirected_to planning_path(assigns(:planning))
  end

  test "should destroy planning" do
    assert_difference('Planning.count', -1) do
      delete :destroy, id: @planning
    end

    assert_redirected_to plannings_path
  end
end
