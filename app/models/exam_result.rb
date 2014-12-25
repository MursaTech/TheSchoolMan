# == Schema Information
#
# Table name: exam_results
#
#  id         :integer          not null, primary key
#  stream_id  :integer
#  exam_id    :integer
#  student_id :integer
#  subject_id :integer
#  score      :string(255)
#  grade      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ExamResult < ActiveRecord::Base
  belongs_to :stream
  belongs_to :exam
  belongs_to :student
  belongs_to :subject
end
