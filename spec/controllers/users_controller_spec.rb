require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "POST create" do
    it "should create a new user" do
      expect {
        post :create, { :user => { :firstname => "First",
                                   :lastname => "Last", 
                                   :password => "qwerty", 
                                   :password_confirmation => "qwerty" } }
      }.to change(User, :count).by(1)
    end

    it "should redirect to cards" do
      post :create, { :user => { :firstname => "First",
                                   :lastname => "Last", 
                                   :password => "qwerty", 
                                   :password_confirmation => "qwerty" } }
      response.should redirect_to(cards_path)
    end
  end
end