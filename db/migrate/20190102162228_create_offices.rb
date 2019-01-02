class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :street_address
      t.string :city
      t.string :alias
      t.string :contact_no

      t.timestamps
    end
  end
end
