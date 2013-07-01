class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :borrower_id
      t.integer :owner_id
      t.integer :item_id
      t.string :state

      t.timestamps
    end
  end
end
