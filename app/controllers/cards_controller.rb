class CardsController < ApplicationController
	def index
    @cards = Card.all
    respond_to do |format|
      format.html
      format.json  { render :json => @cards }
      format.xml  { render :xml => @cards }
    end
  end

  def new
    @card = Card.new
    @card.fields.build
    respond_to do |format|
      format.html
      format.json  { render :json => @card }
      format.xml  { render :xml => @card }
    end
  end

  def edit
    @card = Card.find(params[:id])
    @card.fields.build
    respond_to do |format|
      format.html 
      format.json  { render :json => @card }
      format.xml  { render :xml => @card }
    end
  end

  def create
    @card = Card.new(card_params)
    if @card.save
    	respond_to do |format|
	    	format.html { redirect_to cards_url }
	      format.json { render json: @card }
	      format.xml { render json: @card }
	    end
    else
      render 'new'
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      respond_to do |format|
        format.html { redirect_to cards_url }
        format.json { render json: @cards }
        format.xml { render json: @cards }
      end
    else
      render 'edit'
    end
  end

  def destroy
    Card.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { render json: @cards }
      format.xml { render json: @cards }
    end
  end

  private
  
  def card_params
    params.require(:card).permit(:firstname, :lastname, :card_photo, fields_attributes: [:id, :name, :description, :_destroy])
  end
end
