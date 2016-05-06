class CreateFestivals < ActiveRecord::Migration
  def change
    create_table :festivals do |t|
      t.text :title
      t.text :subtitle

      t.timestamps null: false
    end
  end
end
