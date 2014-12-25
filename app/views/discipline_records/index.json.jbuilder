json.array!(@disciplines) do |discipline|
  json.extract! discipline, :id, :student_id, :offense, :punishment, :level
  json.url discipline_url(discipline, format: :json)
end
