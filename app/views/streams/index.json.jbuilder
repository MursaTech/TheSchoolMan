json.array!(@streams) do |stream|
  json.extract! stream, :id, :name, :form_id, :user_id, :student_id
  json.url stream_url(stream, format: :json)
end
