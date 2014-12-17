class Student < ActiveRecord::Base
  belongs_to :account
  belongs_to :guradian
end
