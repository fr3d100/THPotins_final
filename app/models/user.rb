class User < ApplicationRecord
	has_secure_password
	belongs_to :city
	has_many :gossips
	has_many :comments
	has_many :likes
	

	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
	
	has_many :join_table_pm_recipients
	has_many :private_messages, through: :join_table_pm_recipients

	validates :password, presence: true, length: { minimum: 6 }
	validates :email, uniqueness: true, presence: true


end