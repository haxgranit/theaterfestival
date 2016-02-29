class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.string :password_digest
      t.text :first_name
      t.text :last_name
      t.text :time_zone
      t.text :location

      t.timestamps null: false
    end
  end
end
