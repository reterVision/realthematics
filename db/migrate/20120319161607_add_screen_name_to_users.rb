class AddScreenNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :screen_name, :string, :limit=>100
  end
end
