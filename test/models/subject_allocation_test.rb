# == Schema Information
#
# Table name: subject_allocations
#
#  id         :integer          not null, primary key
#  stream_id  :integer
#  subject_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class SubjectAllocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
