# frozen_string_literal: true

class GossipsController < ApplicationController
before_action :authenticate_user, only: [:show, :create, :update, :destroy]

  def index
    @gossips = Gossip.order(id: :asc).all
  end
	
	def search
	end
	
	def search_post
		if Gossip.include_id?(params[:id].to_s.to_i)  
			redirect_to "/gossips/#{params[:id].to_s}"  
		else
			redirect_to "/error_404"
		end
	end

  def search; end

  def new; end

  # POST create a new photo
  def create
		@user = current_user
    gossip = Gossip.new
				gossip.author = @user
       	gossip.title =  params['title']
       	gossip.text = params['text']
				gossip.save
				redirect_to "/"
	end
  def show
    @gossip = Gossip.find(params[:id].to_s)
    @gossips = Gossip.all
    @id = :id.to_s
    @comments = @gossip.commentaries
  end

  # GET return an HTML form for editing a photo
  def edit
		@gossip = Gossip.find(params[:id])
  end

  # PATCH/PUT update a specific photo
  def update
		@gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip][:title], text: params[:gossip][:text])
			@gossip.save
			redirect_to "/"
		else
			redirect_to edit_gossip_path
		end
  end

  # DELETE delete a specific photo
  def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to root_path
	end
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

  def update
    @gossip = Gossip.find(:id.to_s)
    @id = id.to_s
  end

  # PATCH/PUT update a specific photo
  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  def edit
    gossip = Gossip.find(:id.to_s)
    gossip.title = params['title']
    gossip.text = params['text']
  end

  # DELETE delete a specific photo
  # Méthode qui récupère le potin concerné et le détruit en base
  # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)

  def delete; end
end

