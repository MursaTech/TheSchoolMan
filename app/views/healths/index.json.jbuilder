json.array!(@healths) do |health|
  json.extract! health, :id, :student_id, :diagonosis, :prescription, :need_for_outside_referral, :user_id
  json.url health_url(health, format: :json)
end
