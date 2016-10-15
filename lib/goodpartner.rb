require 'capybara/dsl'
require 'capybara-webkit'
require 'clearbit'
Dir[File.expand_path('./lib/goodpartner/job_scrapers/*', File.dirname(__FILE__))].each { |file| require file }
Dir[File.expand_path('./lib/goodpartner/finders/*', File.dirname(__FILE__))].each { |file| require file }

Clearbit.key = ENV['CLEARBIT_KEY']

module GoodPartner
  class << self
    def discovery_search(args)
      Clearbit::Discovery.search(args)
    end
  end

  class Scraper
    include Capybara::DSL
  end
end

# Dir[File.expand_path('../lib/goodpartner/job_scrapers/*', File.dirname(__FILE__))].each { |file| require file }
# Dir[File.expand_path('../lib/goodpartner/finders/*', File.dirname(__FILE__))].each { |file| require file }
