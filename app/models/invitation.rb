class Invitation < ActiveRecord::Base
  belongs_to :sender, :class_name => "Users", :foreign_key => "sender_id"
  has_one :reciepient, :class_name => "Users"

  validates_presence_of :recipient_email


  attr_accessible :recipient_email, :sender_id, :sent_at, :token
end
