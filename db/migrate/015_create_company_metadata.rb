class CreateCompanyMetadata < ActiveRecord::Migration
  def change
    create_table :company_metadata do |t|
      t.references :company, index: true, foreign_key: true
      t.text :address1
      t.text :address2
      t.date :date_founded
      t.text :location_founded
      t.text :founders
      t.text :mission
      t.text :history

      t.timestamps null: false
    end
  end
end
