class Company < ApplicationRecord
  has_many :jobs
  has_many :people
end
