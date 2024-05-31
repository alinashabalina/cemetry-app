class AddSocialsToGuides < ActiveRecord::Migration[7.1]
  def change
    add_column :guides, :social_1, :string
    add_column :guides, :social_2, :string
    add_column :guides, :social_3, :string
  end
end
