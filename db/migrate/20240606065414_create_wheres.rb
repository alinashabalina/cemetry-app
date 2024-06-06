class CreateWheres < ActiveRecord::Migration[7.1]
  def change
    create_table :wheres do |t|
      t.string :title

      t.timestamps
    end
  end
end
