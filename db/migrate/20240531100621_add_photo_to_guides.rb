class AddPhotoToGuides < ActiveRecord::Migration[7.1]
  def change
    add_column :guides, :photo, :string
  end
end
