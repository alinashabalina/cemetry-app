class AddDetailsToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :details, :string
  end
end
