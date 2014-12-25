# == Schema Information
#
# Table name: forms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Form < ActiveRecord::Base
	has_many :streams
end
