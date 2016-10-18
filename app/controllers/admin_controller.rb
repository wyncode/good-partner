class AdminController < ApplicationController
  def dashboard
    params[:days] ||= 1

    @recent_jobs = Job.recent_jobs params[:days].to_i

    @jobs_with_company_info = @recent_jobs.reject { |j| j.company.body.nil? }
    @jobs_without_company_info = @recent_jobs.select { |j| j.company.body.nil? }

    @total_jobs = Job.all.size
    @total_companies = Company.all.size
  end
end
