# == Schema Information
#
# Table name: discipline_records
#
#  id         :integer          not null, primary key
#  student_id :integer
#  offense    :string(255)
#  punishment :string(255)
#  level      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class DisciplineRecord < ActiveRecord::Base
  belongs_to :student
end
