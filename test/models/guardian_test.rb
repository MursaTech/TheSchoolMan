# == Schema Information
#
# Table name: guardians
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  phone_number :string(255)
#  address      :string(255)
#  id_number    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
