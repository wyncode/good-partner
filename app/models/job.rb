class Job < ApplicationRecord
  belongs_to :company

  self.per_page = 10
end
