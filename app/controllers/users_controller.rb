class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html {redirect_to cards_url}
        format.json { 
                     User.create(card_params)
                     render text: User.last.to_json
                    }
        format.xml { 
                     User.create(user_params)
                     render text: User.last.to_xml
                    }
      end
      log_in @user
    else
      render 'new'
    end
  end

  def logged_in_user
    unless logged_in?
        flash[:danger] = "Please log in!"
        redirect_to login_url
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end