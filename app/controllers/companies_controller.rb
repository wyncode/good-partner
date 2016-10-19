class CompaniesController < ApplicationController
  before_action :set_company, only: :show

  def show
    @company.body = {} if @company.body.nil?
  end

  def index
    @companies = Company.page(params[:page]).order('created_at DESC')
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end
end
