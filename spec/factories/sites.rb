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

FactoryGirl.define do
  factory :site do
    name "MyString"
    icon "MyString"
    url "MyString"
    patterns "MyString"
    featured_patterns "MyString"
    score 1
    description "MyString"
  end

end
