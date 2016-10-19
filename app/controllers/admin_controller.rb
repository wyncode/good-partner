class AdminController < ApplicationController
  def dashboard
    @recent_jobs = Job.page(params[:page]).order('created_at DESC')

    @featured_companies = Company.page(params[:page]).featured if params[:sort]

    @total_jobs = Job.all.size
    @total_companies = Company.all.size
    @total_people = Person.all.size
  end
end
