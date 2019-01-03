class AddDefaultToServicesStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :status, :integer, default: 0
  end
end
