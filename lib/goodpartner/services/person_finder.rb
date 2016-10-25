module GoodPartner
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
      result = {} if result.nil?

      Person.create(company: @company, body: result)
    end
  end
end
