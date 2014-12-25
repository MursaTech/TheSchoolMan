# == Schema Information
#
# Table name: attendance_sheets
#
#  id         :integer          not null, primary key
#  student_id :integer
#  user_id    :integer
#  stream_id  :integer
#  present    :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class AttendanceSheet < ActiveRecord::Base
  belongs_to :student
  belongs_to :user
  belongs_to :stream
end
