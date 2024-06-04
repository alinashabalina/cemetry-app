class AddGuideToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :guide, foreign_key: true
  end
end
