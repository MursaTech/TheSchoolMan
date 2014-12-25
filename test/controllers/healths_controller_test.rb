require 'test_helper'

class HealthsControllerTest < ActionController::TestCase
  setup do
    @health_record = healths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:healths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create health" do
    assert_difference('Health.count') do
      post :create, health: { diagonosis: @health_record.diagonosis, need_for_outside_referral: @health_record.need_for_outside_referral, prescription: @health_record.prescription, student_id: @health_record.student_id, user_id: @health_record.user_id }
    end

    assert_redirected_to health_path(assigns(:health))
  end

  test "should show health" do
    get :show, id: @health_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @health_record
    assert_response :success
  end

  test "should update health" do
    patch :update, id: @health_record, health: { diagonosis: @health_record.diagonosis, need_for_outside_referral: @health_record.need_for_outside_referral, prescription: @health_record.prescription, student_id: @health_record.student_id, user_id: @health_record.user_id }
    assert_redirected_to health_path(assigns(:health))
  end

  test "should destroy health" do
    assert_difference('Health.count', -1) do
      delete :destroy, id: @health_record
    end

    assert_redirected_to healths_path
  end
end
