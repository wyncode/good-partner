class Company < ApplicationRecord
  has_many :jobs
  has_many :people

  self.per_page = 10
end
