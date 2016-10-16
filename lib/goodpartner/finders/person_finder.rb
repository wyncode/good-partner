module GoodPartner
  class PersonFinder

    def self.call(company, opts)
      new(company).find(opts)
    end

    def initialize(company)
      @company = company
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
