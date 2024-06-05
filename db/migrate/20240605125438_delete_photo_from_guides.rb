class DeletePhotoFromGuides < ActiveRecord::Migration[7.1]
  def change
    remove_column :guides, :photo, :string
  end
end
