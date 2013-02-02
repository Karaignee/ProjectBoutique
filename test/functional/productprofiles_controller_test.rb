require 'test_helper'

class ProductprofilesControllerTest < ActionController::TestCase
  setup do
    @productprofile = productprofiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productprofiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productprofile" do
    assert_difference('Productprofile.count') do
      post :create, productprofile: {  }
    end

    assert_redirected_to productprofile_path(assigns(:productprofile))
  end

  test "should show productprofile" do
    get :show, id: @productprofile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productprofile
    assert_response :success
  end

  test "should update productprofile" do
    put :update, id: @productprofile, productprofile: {  }
    assert_redirected_to productprofile_path(assigns(:productprofile))
  end

  test "should destroy productprofile" do
    assert_difference('Productprofile.count', -1) do
      delete :destroy, id: @productprofile
    end

    assert_redirected_to productprofiles_path
  end
end
