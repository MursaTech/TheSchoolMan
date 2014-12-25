# == Schema Information
#
# Table name: students
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  dob                :datetime
#  admission_number   :string(255)
#  account_id         :integer
#  guardian_id        :integer
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  stream_id          :integer
#  previous_school    :string(255)
#  last_exam_score    :string(255)
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
