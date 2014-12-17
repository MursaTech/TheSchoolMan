class ExamResult < ActiveRecord::Base
  belongs_to :stream
  belongs_to :exam
  belongs_to :student
  belongs_to :subject
end
