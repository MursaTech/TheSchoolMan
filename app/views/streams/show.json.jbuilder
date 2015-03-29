json.extract! @stream, :id, :name, :form_id, :user_id, :student_id, :created_at, :updated_at
json.students @stream.students, :id, :name
