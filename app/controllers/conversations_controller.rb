class ConversationsController < ApplicationController

	def index
		@conversations = Conversation.all
	end

	def show
		@conversation = Conversation.find(params['id'])
	end

	def create
		conv = Conversation.new
		conv.title = params['conversation_title']
		JoinUserConversation.create(user: current_user, conversation: conv)

		if params[:conversation_friend]
  		@users = User.search_by_full_name(params[:conversation_friend])
  		puts @users
  		@users.each do |usr|
  			puts usr
  			JoinUserConversation.create(user: usr, conversation: conv)
  		end
  	end

		if conv.save
			flash[:success] = "Conversation créer avec succès"
			redirect_to conversation_path(conv.id)
		else
			flash[:error] = "Nous n'avons pas pu créer une nouvelle conversation"
			redirect_to conversations_path
		end

	end

end
