require 'test_helper'

class SubjectAllocationsControllerTest < ActionController::TestCase
  setup do
    @subject_allocation = subject_allocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subject_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject_allocation" do
    assert_difference('SubjectAllocation.count') do
      post :create, subject_allocation: { stream_id: @subject_allocation.stream_id, subject_id: @subject_allocation.subject_id, user_id: @subject_allocation.user_id }
    end

    assert_redirected_to subject_allocation_path(assigns(:subject_allocation))
  end

  test "should show subject_allocation" do
    get :show, id: @subject_allocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject_allocation
    assert_response :success
  end

  test "should update subject_allocation" do
    patch :update, id: @subject_allocation, subject_allocation: { stream_id: @subject_allocation.stream_id, subject_id: @subject_allocation.subject_id, user_id: @subject_allocation.user_id }
    assert_redirected_to subject_allocation_path(assigns(:subject_allocation))
  end

  test "should destroy subject_allocation" do
    assert_difference('SubjectAllocation.count', -1) do
      delete :destroy, id: @subject_allocation
    end

    assert_redirected_to subject_allocations_path
  end
end
