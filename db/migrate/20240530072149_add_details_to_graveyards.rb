class AddDetailsToGraveyards < ActiveRecord::Migration[7.1]
  def change
    add_column :graveyards, :details, :string
  end
end
