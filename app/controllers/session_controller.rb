class SessionController < ApplicationController
  skip_before_action :redirect_to_login

  def login
    if current_user
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
