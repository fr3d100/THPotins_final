class User < ApplicationRecord
	
  include PgSearch
  pg_search_scope :search_by_full_name, against: [:first_name, :last_name]
	
  attr_accessor :remember_token

	has_secure_password
	
	belongs_to :city
	has_many :gossips
	has_many :comments
	has_many :likes
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
	# has_many :recipients
	# has_many :private_messages, through: :recipients
  has_many :join_user_conversations
  has_many :conversations, through: :join_user_conversations

	# validates :password, presence: true, length: { minimum: 6 }
  
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :email, presence: true, length: { maximum: 255 },
 #                    format: { with: VALID_EMAIL_REGEX },
 #                    uniqueness: { case_sensitive: false }


  class << self
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

   # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

   # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

end

