# == Schema Information
#
# Table name: sites
#
#  id                :integer          not null, primary key
#  name              :string
#  icon              :string
#  url               :string
#  patterns          :string
#  featured_patterns :string
#  score             :integer
#  description       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
