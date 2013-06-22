class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :avatar
      t.integer :value
      t.integer :user_id

      t.timestamps
    end
  end
end
