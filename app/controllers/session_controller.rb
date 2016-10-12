class SessionController < ApplicationController
  def login
    if @current_user && @current_user.admin
      redirect_to root_path
    elsif @current_user && !@current_user.admin
      redirect_to 'http://dashboard.wyncode.co/'
    end
  end

  def logout
    session[:user_id] = nil
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
