class Conversation < ApplicationRecord
	has_many :private_messages
	has_many :join_user_conversations
	has_many :users, through: :join_user_conversations
end
