module GoodPartner
  class CompanyFinder

    def self.call(, opts = {})
      new.find(opts)
    end

    def find(opts = {})
      GoodPartner.discovery_search(opts).results.each do |result|
        save(result)
      end
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
end
