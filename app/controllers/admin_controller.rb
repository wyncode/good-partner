class AdminController < ApplicationController
  def dashboard
    params[:days] ||= 1

    @recent_jobs = Job.recent_jobs params[:days].to_i
  end
end
