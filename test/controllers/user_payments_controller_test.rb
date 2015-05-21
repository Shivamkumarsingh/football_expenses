require 'test_helper'

class UserPaymentsControllerTest < ActionController::TestCase
  setup do
    @user_payment = user_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_payment" do
    assert_difference('UserPayment.count') do
      post :create, user_payment: {  }
    end

    assert_redirected_to user_payment_path(assigns(:user_payment))
  end

  test "should show user_payment" do
    get :show, id: @user_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_payment
    assert_response :success
  end

  test "should update user_payment" do
    patch :update, id: @user_payment, user_payment: {  }
    assert_redirected_to user_payment_path(assigns(:user_payment))
  end

  test "should destroy user_payment" do
    assert_difference('UserPayment.count', -1) do
      delete :destroy, id: @user_payment
    end

    assert_redirected_to user_payments_path
  end
end
