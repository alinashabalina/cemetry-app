class CreateGraveyards < ActiveRecord::Migration[7.1]
  def change
    create_table :graveyards do |t|
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
