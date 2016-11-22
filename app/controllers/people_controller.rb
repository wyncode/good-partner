require "./lib/goodpartner"
require "./lib/goodpartner/services/person_finder"

class PeopleController < ApplicationController
  def index
    @people = Person.all
    @roles = Person.roles
    @companies = Company.all_with_url
  end

  def show
    @person = Person.find(params[:id])
  end

  def search
    @company = Company.find(params[:company])
    url = @company.url

    opts = {
      domain: url,
      limit: params[:limit]
    }

    opts.merge({ role: params[:role] }) unless params[:role].downcase == 'any'

    GoodPartner::PersonFinder.new(@company, opts)

    redirect_to @company
  end
end
