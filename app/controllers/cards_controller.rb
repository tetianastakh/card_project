class CardsController < ApplicationController
	def index
    if params[:search].blank?
      filter
    else
      search
    end
  end

  def new
    @card = Card.new
    @card.fields.build
    card_formats
  end

  def edit
    @card = Card.find(params[:id])
    @card.fields.build
    card_formats
  end

  def create
    @card = Card.new(card_params)
    if @card.save
    	formats_with_redirect
    else
      render 'new'
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      formats_with_redirect
    else
      render 'edit'
    end
  end

  def destroy
    Card.find(params[:id]).destroy
    formats_with_redirect
  end

  private
  
  def card_params
    params.require(:card).permit(:firstname, :lastname, :card_photo, fields_attributes: [:id, :name, :description, :_destroy])
  end

  def filter
    if params[:with_card_photo]
      @cards = Card.where("card_photo_file_name IS NOT NULL").order("created_at #{order}")
      formats
    elsif params[:without_card_photo]
      @cards = Card.where("card_photo_file_name IS NULL").order("created_at #{order}")
      formats
    else
      @cards = Card.all.order("created_at #{order}")
      formats
    end
  end

  def order
    if params[:order_by]
      params[:order_by]
    else
      "DESC"
    end
  end

  def search
    @cards = Card.search(params[:search]).results
    formats
  end

  def formats
    respond_to do |format|
      format.html
      format.json  { render :json => @cards }
      format.xml  { render :xml => @cards }
    end
  end

  def formats_with_redirect
    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { render json: @card }
      format.xml { render json: @card }
    end
  end

  def card_formats
    respond_to do |format|
      format.html
      format.json  { render :json => @card }
      format.xml  { render :xml => @card }
    end
  end
end
