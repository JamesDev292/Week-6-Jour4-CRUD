
class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end


  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.first)
    p "#"*50
    p "la aussi tout va bien"

    if @gossip.save
      redirect_to root_path, notice: "The super potin was successfully saved!"
      p "#"*50
      p "sur le if RAS"
    else
      render new_gossip_path
    end
  end
  

  
  def edit
    @gossip = Gossip.find(params[:id])
  end
  
  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossip_path
  end
  
  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end


