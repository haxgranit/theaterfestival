class AddBannerImages < ActiveRecord::Migration
  def change
    add_column :artists, :banner_image_id, :string
    add_column :companies, :banner_image_id, :string
    add_column :festivals, :banner_image_id, :string
    add_column :productions, :banner_image_id, :string
    add_column :venues, :banner_image_id, :string
  end
end
