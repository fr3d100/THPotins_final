class GossipsController < ApplicationController

  before_action :authenticate_user

	def index
    @gossips = Gossip.all.reverse_order
    puts Gossip.all
  end
   
   def show
  	@gossip = Gossip.find(params['id'])
  	puts @gossip
    @comment = Comment.new
  end

  def new
  	@gossip = Gossip.last
  end

  def edit
    @gossip = Gossip.find(params['id'])
  end

  def create
  	@gossip = Gossip.new
  	@gossip.title = params['gossip_title']
  	@gossip.content = params['gossip_content']
  	@gossip.user = current_user

  	if @gossip.save # essaie de sauvegarder en base @gossip
  		flash[:success] = "Potin créé avec succès!"
      redirect_to gossips_path
	  else
      flash[:danger] = []
      @gossip.errors.full_messages.each do |message|
        flash[:danger] << message
      end
      flash[:danger] = flash[:danger].join(" & ")

      redirect_to new_gossip_path
    end

  end

  def update
    @gossip = Gossip.find(params["id"])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end

  def destroy
    @gossip = Gossip.find(params['id'])
    if @gossip.destroy
      flash[:success] = "Le potin a bien été supprimé!"
      redirect_to root_path
    else
      flash[:danger] = "La supression n'a pas fontionnée ..."
      redirect_to gossip_path(@gossip.id)
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez vous connecter pour accéder à cet espace"
      redirect_to new_session_path
    end
  end

end
