class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :production, index: true, foreign_key: true
      t.date :date
      t.integer :rating
      t.text :title
      t.text :summary
      t.text :full_text
      t.integer :agree
      t.integer :disagree

      t.timestamps null: false
    end
  end
end
