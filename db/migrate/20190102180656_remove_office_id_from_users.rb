class RemoveOfficeIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :office, foreign_key:true
  end
end
