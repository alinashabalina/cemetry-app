class AddStatusToTours < ActiveRecord::Migration[7.1]
  def change
    add_column :tours, :status, :string, default: "created"
  end
end
