require 'test_helper'

class ExamResultsControllerTest < ActionController::TestCase
  setup do
    @exam_result = exam_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exam_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam_result" do
    assert_difference('ExamResult.count') do
      post :create, exam_result: { exam_id: @exam_result.exam_id, grade: @exam_result.grade, score: @exam_result.score, stream_id: @exam_result.stream_id, student_id: @exam_result.student_id, subject_id: @exam_result.subject_id }
    end

    assert_redirected_to exam_result_path(assigns(:exam_result))
  end

  test "should show exam_result" do
    get :show, id: @exam_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam_result
    assert_response :success
  end

  test "should update exam_result" do
    patch :update, id: @exam_result, exam_result: { exam_id: @exam_result.exam_id, grade: @exam_result.grade, score: @exam_result.score, stream_id: @exam_result.stream_id, student_id: @exam_result.student_id, subject_id: @exam_result.subject_id }
    assert_redirected_to exam_result_path(assigns(:exam_result))
  end

  test "should destroy exam_result" do
    assert_difference('ExamResult.count', -1) do
      delete :destroy, id: @exam_result
    end

    assert_redirected_to exam_results_path
  end
end
