class CreateCompanyFestivalLinks < ActiveRecord::Migration
  def change
    create_table :company_festival_links do |t|
      t.references :company, index: true, foreign_key: true
      t.references :festival, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
