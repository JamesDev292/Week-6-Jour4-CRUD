class UsersController < ApplicationController

  def new
    user = User.new
  end



  def show
    user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)

    if user.save
      log_in(user) # Connecte l'utilisateur après la création
      redirect_to gossips_path, notice: "Compte créé avec succès."
    
    else
      flash.now[:danger] = "Erreur lors de la création du compte."
      render :new # Rendre la vue new pour afficher le formulaire avec les erreurs
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :city_id, :password)
  end
end