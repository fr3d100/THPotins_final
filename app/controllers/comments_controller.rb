class CommentsController < ApplicationController
	
	before_action :authenticate_user
	
	def create
		@comment = Comment.new
		user = current_user
		gossip = Gossip.find(params['gossip_id'])
		puts gossip.id
		@comment.user = user
		@comment.gossip = gossip
		@comment.content = params['comment_content']

		if @comment.save 
			redirect_to gossip_path(@comment.gossip.id)
		else
			redirect_to gossip_path(@gossip.id)
		end
	end

	 def destroy
	 	puts 'On est bien dans le destroy des comments'
	 	puts params
    @comment = Comment.find(params['id'])
    if @comment.destroy
      flash[:success] = "Le commentaire a bien été delete!"
      redirect_to gossip_path(params['gossip_id'])
    else
      flash[:danger] = "Le potin n'a pas été supprimé ..."
      redirect_to root_path
    end
  end

  def edit
  	@gossip = Gossip.find(params['gossip_id'])
  	@comment = Comment.find(params['id'])
  end

   def update
    @comment = Comment.find(params["id"])
    comment_params = params.require(:comment).permit(:content)
    @comment.update(comment_params)
    redirect_to gossip_path(@comment.gossip.id)
  end

   private

  def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez vous connecter pour accéder à cet espace"
      redirect_to new_session_path
    end
  end

end
