# == Schema Information
#
# Table name: uploads
#
#  id                :integer          not null, primary key
#  name              :string
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  file_path         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Upload < ApplicationRecord
  has_attached_file :file, :path => ":rails_root/public/uploads/:filename"
  validates_attachment_content_type :file, :content_type => %w(text/xml)
end
