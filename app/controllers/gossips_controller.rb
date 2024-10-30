
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
  def update
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end
  def show
    @gossip = Gossip.find(params[:id])
  end
end
