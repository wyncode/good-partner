class ChangeCompanyInJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :company
    add_reference :jobs, :company, foreign_key: true
  end
end
