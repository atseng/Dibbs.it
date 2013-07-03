class PhoneNumberFieldForUser < ActiveRecord::Migration
  def up
    add_column :users, :phone_number, :string
    add_column :users, :receives_notifications, :boolean, :default => false
  end

  def down
    remove_column :users, :phone_number
    remove_column :users, :receives_notifications
  end
end
