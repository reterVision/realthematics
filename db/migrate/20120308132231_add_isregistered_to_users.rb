class AddIsregisteredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_registered, :boolean

  end
end
