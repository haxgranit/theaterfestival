class AddKeyImageToProductions < ActiveRecord::Migration
  def change
    add_column :productions, :key_image_id, :string
    add_column :productions, :key_image_credit, :text
  end
end
