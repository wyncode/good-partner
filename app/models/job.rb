class Job < ApplicationRecord
  belongs_to :company

  self.per_page = 10

  def no_company_info
    company.body.nil?
  end
end
