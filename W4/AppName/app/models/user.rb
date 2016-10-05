class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password_digest, length: { length: 6, allow_null: true }
  before_validation :ensure_session_token

  attr_reader :password

  def find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && BCrypt::Password.new(password_digest).is_password?(password)
    nil
  end

  def generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(new_password)
    @password = new_password
    password_digest = BCrypt::Password.create(new_password)
  end

end
