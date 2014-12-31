json.extract! @student, :id, :name, :dob, :admission_number, :account_id, :guardian_id, :created_at, :updated_at
json.stream @student.stream, :id, :name, :form_id
