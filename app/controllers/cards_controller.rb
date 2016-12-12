class CardsController < ApplicationController
	def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(card_params)
      if @card.save
      redirect_to cards_url
    else
      render 'new'
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      redirect_to cards_url
    else
      render 'edit'
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end

  def destroy
    Card.find(params[:id]).destroy
    redirect_to cards_url
  end

  private
  
  def card_params
    params.require(:card).permit(:firstname, :lastname)
  end
end
