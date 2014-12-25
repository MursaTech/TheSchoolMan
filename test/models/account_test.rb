# == Schema Information
#
# Table name: accounts
#
#  id                 :integer          not null, primary key
#  email              :string(255)
#  setup              :boolean          default(FALSE)
#  boolean            :boolean          default(FALSE)
#  user_id            :integer
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
