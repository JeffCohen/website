class Attendee < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  before_save :lowercase_email

  def lowercase_email
    self.email.downcase! if self.email
  end
end
