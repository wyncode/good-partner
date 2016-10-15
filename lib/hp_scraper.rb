require 'capybara/dsl'
require 'capybara-webkit'
require 'clearbit'

Clearbit.key = ENV['CLEARBIT_KEY']

class HPScraper
  include Capybara::DSL

  attr_reader :company

  def self.call(company)
    new(company).find
  end

  def initialize(company)
    @company = company
  end

  def find
    query = [{ name: company.name }]

    result = Clearbit::Discovery.search(
                                        query: query,
                                        sort: 'google_rank'
                                        ).results.first
    save(result)
  end

  def save(result)
    result = {} if result.nil?
    c = Company.find_or_create_by(name: result['name']) do |co|
      co.body = result
    end
    c.body = result
    c.save
  end
end
