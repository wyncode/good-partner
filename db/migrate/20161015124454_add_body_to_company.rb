class AddBodyToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :body, :json
  end
end
