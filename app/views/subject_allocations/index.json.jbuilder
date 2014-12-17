json.array!(@subject_allocations) do |subject_allocation|
  json.extract! subject_allocation, :id, :stream_id, :subject_id, :user_id
  json.url subject_allocation_url(subject_allocation, format: :json)
end
