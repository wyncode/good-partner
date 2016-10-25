module GoodPartner
  class CompanyFinder

    def initialize(opts)
      find(opts)
    end

    def find(opts)
      GoodPartner.discovery_search(opts).results.each do |result|
        save(result)
      end
    end

    def save(result)
      result = {} if result.nil?

      if c = Company.find_by("name ilike ?", result['name'])
        result.reject! { |k, v| v.nil? }
        c.body = {} if c.body.nil?
        c.body = result.merge(c.body)
        c.save
      else
        Company.create(name: result['name'], body: result)
      end
    end
  end
end
