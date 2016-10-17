class Job < ApplicationRecord
  belongs_to :company

  def self.recent_jobs(days)
    where('created_at < ?', days.day.ago)
  end
end
