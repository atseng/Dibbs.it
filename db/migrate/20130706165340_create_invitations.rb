class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :sender_id
      t.string :reciepient_email
      t.string :token
      t.datetime :sent_at

      t.timestamps
    end
  end
end
