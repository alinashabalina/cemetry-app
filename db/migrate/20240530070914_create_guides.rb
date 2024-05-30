class CreateGuides < ActiveRecord::Migration[7.1]
  def change
    create_table :guides do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
