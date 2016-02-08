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

require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
