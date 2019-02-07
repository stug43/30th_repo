# frozen_string_literal: true

class GossipsController < ApplicationController
<<<<<<< HEAD
before_action :authenticate_user, only: [:show, :create, :update, :destroy]

=======
  # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
>>>>>>> 510d0ba761c930da3c4c651128718697155a5860
  def index
    @gossips = Gossip.order(id: :asc).all
  end
<<<<<<< HEAD
	
	def search
	end
	
	def search_post
		if Gossip.include_id?(params[:id].to_s.to_i)  
			redirect_to "/gossips/#{params[:id].to_s}"  
		else
			redirect_to "/error_404"
		end
	end

  # GET return an HTML form for creating a new potin
=======

  def search_post
    if Gossip.include_id?(params[:id].to_s.to_i)
      redirect_to "/gossips/#{params[:id]}"
    else
      redirect_to '/error_404'
    end
   end

  def search; end

  # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
>>>>>>> 510d0ba761c930da3c4c651128718697155a5860
  def new; end

  # POST create a new photo
  def create
<<<<<<< HEAD
		@user = current_user
    gossip = Gossip.new
				gossip.author = @user
       	gossip.title =  params['title']
       	gossip.text = params['text']
				gossip.save
				redirect_to "/"
	end
=======
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)

    #    my_user = User.create(first_name: params['first_name'],
    #                          last_name: params['last_name'],
    #                          email: params['email'],
    #                          age: params['age'],
    #                          user_name: params['user_name'])
    #   Gossip.create(author: my_user,
    #                  title: params['title'],
    #                 text: params['text'])
    my_user = User.create(first_name: params['first_name'],
                          last_name: params['last_name'],
                          email: params['email'],
                          age: params['age'],
                          user_name: params['user_name'])
    Gossip.create(author: my_user,
                  title: params['title'],
                  text: params['text'])
  end
>>>>>>> 510d0ba761c930da3c4c651128718697155a5860

  # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  def show
    @gossip = Gossip.find(params[:id].to_s)
    @gossips = Gossip.all
    @id = :id.to_s
    @comments = @gossip.commentaries
  end

  # GET return an HTML form for editing a photo
<<<<<<< HEAD
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
=======
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
>>>>>>> 510d0ba761c930da3c4c651128718697155a5860
end
