# == Schema Information
#
# Table name: user_accounts
#
#  id           :integer          not null, primary key
#  account_id   :integer
#  user_id      :integer
#  is_preferred :boolean          default(FALSE)
#  boolean      :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class UserAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
