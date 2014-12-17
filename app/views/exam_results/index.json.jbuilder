json.array!(@exam_results) do |exam_result|
  json.extract! exam_result, :id, :stream_id, :exam_id, :student_id, :subject_id, :score, :grade
  json.url exam_result_url(exam_result, format: :json)
end
