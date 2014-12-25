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

class Stream < ActiveRecord::Base
  belongs_to :form
  belongs_to :user
  belongs_to :student
  has_many :students
end
