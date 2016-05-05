class CreateCompanySocialMetadata < ActiveRecord::Migration
  def change
    create_table :company_social_metadata do |t|
      t.text :twitter
      t.text :facebook
      t.text :linkedin
      t.text :tumblr
      t.text :vine
      t.text :snapchat
      t.text :instagram

      t.timestamps null: false
    end
  end
end
