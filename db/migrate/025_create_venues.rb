class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.text :name
      t.text :address1
      t.text :address2
      t.text :website
      t.text :phone_number
      t.text :description
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
