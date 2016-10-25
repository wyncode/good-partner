class AddSourceToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :source, :string
  end
end
