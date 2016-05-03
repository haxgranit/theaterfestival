class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.text :title
      t.boolean :public
      t.text :tagline
      t.text :description
      t.date :first_performance
      t.date :last_performance

      t.timestamps null: false
    end
  end
end
