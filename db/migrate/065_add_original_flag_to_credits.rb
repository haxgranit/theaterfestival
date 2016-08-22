class AddOriginalFlagToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :original, :boolean
  end
end
