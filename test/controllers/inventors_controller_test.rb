require 'test_helper'

class InventorsControllerTest < ActionController::TestCase
  setup do
    @inventor = inventors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventor" do
    assert_difference('Inventor.count') do
      post :create, inventor: { about: @inventor.about, invention_date: @inventor.invention_date, name: @inventor.name }
    end

    assert_redirected_to inventor_path(assigns(:inventor))
  end

  test "should show inventor" do
    get :show, id: @inventor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventor
    assert_response :success
  end

  test "should update inventor" do
    patch :update, id: @inventor, inventor: { about: @inventor.about, invention_date: @inventor.invention_date, name: @inventor.name }
    assert_redirected_to inventor_path(assigns(:inventor))
  end

  test "should destroy inventor" do
    assert_difference('Inventor.count', -1) do
      delete :destroy, id: @inventor
    end

    assert_redirected_to inventors_path
  end
end
