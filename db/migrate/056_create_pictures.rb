class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :credit
      t.string :image_id
      t.string :has_image_type
      t.string :has_image_id

      t.timestamps null: false
    end
    add_index :pictures, :has_image_id
  end
end
