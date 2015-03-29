# == Schema Information
#
# Table name: students
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  dob                :datetime
#  admission_number   :string(255)
#  account_id         :integer
#  guardian_id        :integer
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  stream_id          :integer
#  previous_school    :string(255)
#  last_exam_score    :string(255)
#  gender             :string(255)
#

class Student < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  belongs_to :account
  belongs_to :guardian
  belongs_to :stream
end
