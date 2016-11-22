class Person < ApplicationRecord
  belongs_to :company

  def self.roles
    %w(
      any ceo communications consulting customer_service
      education engineering finance founder
      health_professional human_resources information_technology
      legal marketing operations owner president product
      public_relations real_estate recruiting research sales
    )
  end
end
