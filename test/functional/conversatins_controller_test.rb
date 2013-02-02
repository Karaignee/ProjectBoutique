require 'test_helper'

class ConversatinsControllerTest < ActionController::TestCase
  setup do
    @conversatin = conversatins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conversatins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conversatin" do
    assert_difference('Conversatin.count') do
      post :create, conversatin: { id: @conversatin.id, title: @conversatin.title }
    end

    assert_redirected_to conversatin_path(assigns(:conversatin))
  end

  test "should show conversatin" do
    get :show, id: @conversatin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conversatin
    assert_response :success
  end

  test "should update conversatin" do
    put :update, id: @conversatin, conversatin: { id: @conversatin.id, title: @conversatin.title }
    assert_redirected_to conversatin_path(assigns(:conversatin))
  end

  test "should destroy conversatin" do
    assert_difference('Conversatin.count', -1) do
      delete :destroy, id: @conversatin
    end

    assert_redirected_to conversatins_path
  end
end
