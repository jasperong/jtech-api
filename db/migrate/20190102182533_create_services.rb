class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.date :date
      t.references :user, foreign_key: true
      t.references :office, foreign_key: true
      t.integer :status
      t.money :fare

      t.timestamps
    end
  end
end
