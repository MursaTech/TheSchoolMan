class Stream < ActiveRecord::Base
  belongs_to :form
  belongs_to :user
  belongs_to :student
end
