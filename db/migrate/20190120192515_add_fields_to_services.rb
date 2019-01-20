class AddFieldsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :contact_name, :string
    add_column :services, :work_requested, :text
    add_column :services, :work_done, :text
    add_column :services, :ticket_no, :string
    add_column :services, :start_time, :datetime
    add_column :services, :end_time, :datetime
  end
end
