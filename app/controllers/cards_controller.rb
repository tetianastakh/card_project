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
  end

  def edit
    @card = Card.find(params[:id])
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
	    	format.html {redirect_to cards_url}
	      format.json { 
	                   Card.create(card_params)
	                   render text: Card.last.to_json
	                  }
	      format.xml { 
                     Card.create(card_params)
                     render text: Card.last.to_xml
                    }
	    end
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

  def destroy
    Card.find(params[:id]).destroy
    redirect_to cards_url
  end

  private
  
  def card_params
    params.require(:card).permit(:firstname, :lastname)
  end
end
