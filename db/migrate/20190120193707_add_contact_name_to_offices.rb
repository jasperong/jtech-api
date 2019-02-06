class AddContactNameToOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :contact_name, :string
    add_column :services, :contact_no, :string
  end
end
