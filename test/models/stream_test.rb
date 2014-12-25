# == Schema Information
#
# Table name: streams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  form_id    :integer
#  user_id    :integer
#  student_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class StreamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
