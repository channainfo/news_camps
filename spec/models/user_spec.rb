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

require 'rails_helper'

RSpec.describe User, type: :model do
  describe User, '.authenticate' do
    context 'with correct email/password' do

      it "return user" do
        user = create(:user, email: 'vicheka@feedalert.com', password: 'password')

        result = User.authenticate('vicheka@feedalert.com', 'password')

        expect(result).to eq(user)
      end
    end

    context 'with correct username(case insensitive)/password' do
      it 'return user' do
        user = create(:user, username: 'News_camp', password: 'password')
        result = User.authenticate('news_camp', 'password')
        expect(result).to eq(user)
      end
    end


    context 'with incorrect login' do
      it 'return false' do
        create(:user, email: 'user@example.com', password: 'incorrect')

        result = User.authenticate('user@example.com', 'password')

        expect(result).to eq(false)
      end
    end

  end


  describe User, 'on create' do
    it "generate auth_token for permanent login" do
      user = create(:user)
      expect(user.auth_token).to be_present
    end
  end
end
