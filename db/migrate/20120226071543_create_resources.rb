class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :topics_user_id
      t.text :description
      t.string :title
      t.integer :type_id
      t.string :uri

      t.timestamps
    end
  end
end
