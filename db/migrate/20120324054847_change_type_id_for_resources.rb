class ChangeTypeIdForResources < ActiveRecord::Migration
  def change
      remove_column :resources, :type_id
      add_column :resources, :type_id, :string
  end
end
