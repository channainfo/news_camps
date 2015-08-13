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

class User < ActiveRecord::Base
  has_secure_password(validations: false)
  before_create :set_require_attrs

  def generate_token_for(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def set_require_attrs
    generate_token_for(:auth_token)
    self.email = self.email.downcase
    self.username_lower = self.username.downcase
  end


  def self.authenticate(login, password)
    return false unless login.present?
    user = User.where(['username_lower = ? OR email = ?', login.downcase, login.downcase]).first
    if user
      user.authenticate(password)
    else
      false
    end
  end

end
