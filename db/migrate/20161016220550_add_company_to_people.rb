class AddCompanyToPeople < ActiveRecord::Migration[5.0]
  def change
    add_reference :people, :company, foreign_key: true
  end
end
