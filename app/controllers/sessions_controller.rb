class SessionsController < ApplicationController
    def new

    end
    def create
        puts "Params: #{params.inspect}" # Affiche tous les paramètres reçus
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        # Utilise la méthode du helper pour connecter l'utilisateur
        redirect_to root_path
        puts "ok"*50
        
        else
        flash.now[:danger] = "Invalid email/password combination"
        render :new
        puts "no  ok "*50
        end
    end 
    #Params: {"authenticity_token"=>"[TOKEN]", "email"=>"ton_email@example.com", "password"=>"ton_mot_de_passe", "commit"=>"Connexion"}

    def destroy

        session.delete(:user_id) # Supprime l'ID de l'utilisateur de la session
        
        redirect_to new_session_path, notice: "Vous êtes déconnecté."
    end
    


end