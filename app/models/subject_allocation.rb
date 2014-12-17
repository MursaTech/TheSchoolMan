class SubjectAllocation < ActiveRecord::Base
  belongs_to :stream
  belongs_to :subject
  belongs_to :user
end
