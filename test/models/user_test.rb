# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  first_name              :string
#  last_name               :string
#  username                :string
#  email                   :string
#  username_lower          :string
#  ip_address              :inet
#  registration_ip_address :inet
#  locale                  :string
#  password_digest         :string
#  auth_token              :string
#  admin                   :boolean
#  approved                :boolean
#  approved_at             :datetime
#  blocked                 :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
