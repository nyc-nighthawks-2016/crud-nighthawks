class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6}

  has_many :nighthawks

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(value)
    @password = value
    self.password_digest = BCrypt::Password.create(value)
  end
end
