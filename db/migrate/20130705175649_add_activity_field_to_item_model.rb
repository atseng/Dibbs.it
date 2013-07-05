class AddActivityFieldToItemModel < ActiveRecord::Migration
  def up
    add_column :items, :activity, :string
  end

  def down
    remove_column :items, :activity
  end
end
