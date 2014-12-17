json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :student_id, :user_id, :stream_id, :present
  json.url attendance_url(attendance, format: :json)
end
