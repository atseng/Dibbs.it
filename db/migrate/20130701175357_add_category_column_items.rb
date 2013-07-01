class AddCategoryColumnItems < ActiveRecord::Migration
  def up
    add_column :items, :category, :string
  end

  def down
    remove_column :items, :category
  end
end
