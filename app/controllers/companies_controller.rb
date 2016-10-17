class CompaniesController < ApplicationController
  before_action :set_company, only: :show

  def show
  end

  def index
    @clearbit_companies = Company.where.not(body: nil)
    @companies = Company.where(body: nil)
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end
end
