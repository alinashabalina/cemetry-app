class CreateTours < ActiveRecord::Migration[7.1]
  def change
    create_table :tours do |t|
      t.string :title
      t.references :guide, null: false, foreign_key: true
      t.references :graveyard, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
