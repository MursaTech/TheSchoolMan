# == Schema Information
#
# Table name: health_records
#
#  id                        :integer          not null, primary key
#  student_id                :integer
#  diagonosis                :text
#  prescription              :string(255)
#  need_for_outside_referral :boolean
#  user_id                   :integer
#  created_at                :datetime
#  updated_at                :datetime
#

class HealthRecord < ActiveRecord::Base
  belongs_to :student
  belongs_to :user
end
