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

class SubjectAllocation < ActiveRecord::Base
  belongs_to :stream
  belongs_to :subject
  belongs_to :user
end
