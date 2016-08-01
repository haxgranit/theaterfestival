class AddResourceToPermissions < ActiveRecord::Migration
  def change
    add_reference :permissions, :resource, polymorphic: true, index: true
  end
end
