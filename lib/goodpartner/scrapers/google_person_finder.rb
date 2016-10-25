require "httparty"

module GoodPartner
  class GooglePersonScraper < Scraper
    def initialize(opts)
      find(opts)
    end

    def find(opts)
      # url = "https://www.googleapis.com/customsearch/v1?key=#{ENV['GOOGLE_API_KEY']}&cx=004856392166816214515:xu-pnl28wuc"
      # query = { q: opts[:company] }
      # HTTParty.get(url, query: query)
    end
  end
end
