class CreateCompanyProductionLinks < ActiveRecord::Migration
  def change
    create_table :company_production_links do |t|
      t.references :company, index: true, foreign_key: true
      t.references :production, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
