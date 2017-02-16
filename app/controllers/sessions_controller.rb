class SesssionsController < ApplicationController

  def create
    user = User.find_by_credentials(
    params[:user][:email],
    params[:user][:password]
    )

    unless user
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    else
      login_user!(user)
      redirect_to user_url
    end
  end


end
