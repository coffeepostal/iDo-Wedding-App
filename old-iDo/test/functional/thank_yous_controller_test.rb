require 'test_helper'

class ThankYousControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thank_yous)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thank_yous" do
    assert_difference('ThankYous.count') do
      post :create, :thank_yous => { }
    end

    assert_redirected_to thank_yous_path(assigns(:thank_yous))
  end

  test "should show thank_yous" do
    get :show, :id => thank_yous(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => thank_yous(:one).to_param
    assert_response :success
  end

  test "should update thank_yous" do
    put :update, :id => thank_yous(:one).to_param, :thank_yous => { }
    assert_redirected_to thank_yous_path(assigns(:thank_yous))
  end

  test "should destroy thank_yous" do
    assert_difference('ThankYous.count', -1) do
      delete :destroy, :id => thank_yous(:one).to_param
    end

    assert_redirected_to thank_yous_path
  end
end
