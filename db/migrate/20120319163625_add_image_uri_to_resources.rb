class AddImageUriToResources < ActiveRecord::Migration
  def change
    add_column :resources, :image_uri, :string
  end
end
