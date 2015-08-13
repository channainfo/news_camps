# == Schema Information
#
# Table name: site_contents
#
#  id          :integer          not null, primary key
#  url         :string
#  title       :string
#  description :string
#  content     :string
#  keywords    :string
#  media       :string
#  icon        :string
#  site_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  images      :text             default([]), is an Array
#

require 'test_helper'

class SiteContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
