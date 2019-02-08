class PrivateMessage < ApplicationRecord
	belongs_to :sender, class_name: "User"
	belongs_to :conversation
	
	has_many :recipients
	has_many :users, through: :recipients

	validates :content, presence: true

end
