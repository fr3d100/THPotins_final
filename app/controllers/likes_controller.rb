class LikesController < ApplicationController

	def create
		@like = Like.new
		user = current_user
		gossip = Gossip.find(params['gossip_id'])
		puts "Gossip ID : #{gossip.id}"
		@like.user = user
		@like.gossip = gossip

		if @like.save 
			puts "*"*100
			puts 'Le like a été enregistré'
			puts "*"*100
			# redirect_to gossip_path(gossip.id)
			redirect_to request.referrer
		else
			puts "*"*100
			puts "Le like n'a pas été enregistré"
			puts "*"*100
			# redirect_to gossip_path(@gossip.id)
			redirect_to request.referrer
		end
	end

	def destroy
	 	puts 'On est bien dans le destroy des likes'
    @like = Like.find(params['id'])
    gossip = @like.gossip
    if @like.destroy
    	puts "*"*100
    	puts "Le like a été supprimé"
    	puts "*"*100
      # redirect_to gossip_path(gossip.id)
      redirect_to request.referrer
    else
    	puts "*"*100
    	puts "Le like n'a pas été supprimé"
    	puts "*"*100
      flash[:danger] = "Votre like n'a pas été supprimé"
      redirect_to request.referrer
      # redirect_to gossip_path(gossip.id)
    end
  end


end
