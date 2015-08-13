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

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    username "MyString"
    email FFaker::Internet.email
    username_lower "MyString"
    ip_address "MyString"
    registration_ip_address "MyString"
    locale "MyString"
    password_digest "MyString"
    auth_token "MyString"
    admin false
    approved false
    approved_at "2015-08-13 12:21:10"
    blocked false
  end

end
