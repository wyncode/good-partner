class AddLinkedInAuthCodeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :linked_in_auth_code, :text
  end
end
