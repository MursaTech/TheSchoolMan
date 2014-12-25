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

require 'test_helper'

class ExamResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
