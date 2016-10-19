class Job < ApplicationRecord
  belongs_to :company, counter_cache: true

  self.per_page = 10

  def no_company_info
    company.body.nil?
  end
end
