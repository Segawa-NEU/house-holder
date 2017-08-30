class User < ApplicationRecord
  before_create :confirmation_token
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :username, :password, length: { minimum: 8}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  has_secure_password
  belongs_to :house, optional: true
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
