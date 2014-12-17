class Attendance < ActiveRecord::Base
  belongs_to :student
  belongs_to :user
  belongs_to :stream
end
