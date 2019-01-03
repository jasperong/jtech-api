class AddCurrentOfficeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :office, foreign_key: true
    add_column :users, :service_status, :integer
  end
end
