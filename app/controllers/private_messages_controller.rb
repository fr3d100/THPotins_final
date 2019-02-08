class PrivateMessagesController < ApplicationController

	def create
		@pm = PrivateMessage.new
		conversation = Conversation.find(params['conversation_id'])
		puts conversation.id
		@pm.sender = current_user
		@pm.conversation = conversation
		@pm.content = params['pm_content']

		if @pm.save 
			redirect_to conversation_path(conversation.id)
		else
			flash[:danger] = []
      @pm.errors.full_messages.each do |message|
        flash[:danger] << message
      end
      flash[:danger] = flash[:danger].join(" & ")
			redirect_to conversation_path(conversation.id)
		end
	end


end
