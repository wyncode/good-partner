class AddJobCountToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :jobs_count, :integer, default: 0
  end
end
