class AddCompanyIdToProductions < ActiveRecord::Migration
  def change
    add_reference :productions, :company, index: true, foreign_key: true
  end
end
