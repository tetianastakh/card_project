require "rails_helper"

RSpec.describe CardsController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    it "should create a new card" do
      expect {
        post :create, { :card => { :firstname => "First", :lastname => "Last" }}
      }.to change(Card, :count).by(1)
    end

    it "should redirect to cards" do
       post :create, { :card => { :firstname => "First", :lastname => "Last" }}
       response.should redirect_to(cards_path)
    end
  end

  describe "PUT update" do
  	before :each do
    @card = Card.create(:firstname => "First", :lastname => "Last")
    @attr = { :firstname => "New", :lastname => "Name" }
    end
    it "should update a card" do
      put :update, :id => @card.id, :card => @attr
      @card.reload.firstname.should eql @attr[:firstname]
    end

    it "should redirect to cards" do
       put :update, :id => @card.id, :card => @attr
       response.should redirect_to(cards_path)
    end
  end

  describe "DELETE destroy" do
  	before :each do
    @card = Card.create(:firstname => "First", :lastname => "Last")
    end
    it "should delete a card" do
      expect{ 
        delete :destroy, :id => @card
      }.to change(Card, :count).by(-1)
    end

    it "should redirect to cards" do
       delete :destroy, :id => @card
       response.should redirect_to(cards_path)
    end
  end
end