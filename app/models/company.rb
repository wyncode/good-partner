class Company < ApplicationRecord
  has_many :jobs
  has_many :people

  self.per_page = 10

  scope :featured, -> { order('jobs_count DESC') }

  def self.all_with_url
    where.not(body: nil).reject { |c| c.body['url'].nil? }
  end

  def url
    body['url']
  end
end
