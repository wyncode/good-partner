class RemoveLinkedInFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :linked_in_auth_code, :string
  end
end
