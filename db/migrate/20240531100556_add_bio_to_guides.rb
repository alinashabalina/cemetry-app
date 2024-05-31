class AddBioToGuides < ActiveRecord::Migration[7.1]
  def change
    add_column :guides, :bio, :string
  end
end
