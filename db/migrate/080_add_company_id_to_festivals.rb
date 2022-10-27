class AddCompanyIdToFestivals < ActiveRecord::Migration
  def change
    add_reference :festivals, :company, index: true, foreign_key: true
  end
end
