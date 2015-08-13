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

require 'rails_helper'

RSpec.describe SiteContent, type: :model do

end
