class AddInvitationIdAndLimitToUsers < ActiveRecord::Migration
  def up
    add_column :users, :invitation_id, :integer
    add_column :users, :invitation_limit, :integer
  end

  def down
    remove_column :users, :invitation_id
    remove_column :users, :invitation_limit
  end
end
