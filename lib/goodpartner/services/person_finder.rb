module GoodPartner
  # A class to interact with the Clearbit API
  class PersonFinder
    def initialize(company, opts)
      @company = company
      find(opts)
    end

    def find(opts)
      GoodPartner.person_search(opts).each do |result|
        save(result)
      end
    end

    def save(result)
      Person.find_or_create_by(company: @company, body: result)
    end
  end
end
