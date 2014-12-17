json.array!(@students) do |student|
  json.extract! student, :id, :name, :dob, :admission_number, :account_id, :guradian_id
  json.url student_url(student, format: :json)
end
