class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.text :first_name
      t.text :last_name
      t.text :title
      t.date :birthdate
      t.text :birth_location
      t.text :hometown
      t.text :education
      t.text :full_bio
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
