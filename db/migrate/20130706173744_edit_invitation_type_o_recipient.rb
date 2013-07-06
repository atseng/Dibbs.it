class EditInvitationTypeORecipient < ActiveRecord::Migration
  def up
    remove_column :invitations, :reciepient_email
    add_column :invitations, :recipient_email, :string
  end

  def down
    add_column :invitations, :reciepient_email, :string
    remove_column :invitations, :recipient_email
  end
end
