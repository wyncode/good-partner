class ApplicationController < ActionController::Base
  before_action CASClient::Frameworks::Rails::Filter
  protect_from_forgery with: :exception
  before_action :current_user, :redirect_to_login
  helper_method :current_user

  def current_user
    @current_user ||= User.find_for_session(session[:cas_extra_attributes.to_s]) rescue nil
  end

  def redirect_to_login
    if current_user.nil?
      redirect_to '/login'
    end
  end

  def redirect_to_dashboard
    redirect_to 'http://dashboard.wyncode.co/' unless current_user.admin
  end
end
