class AddInfoToTours < ActiveRecord::Migration[7.1]
  def change
    add_column :tours, :info, :string, default: "basic info"
  end
end
