class Invitation < ActiveRecord::Base
  belongs_to :sender, :class_name => "Users", :foreign_key => "sender_id"
  has_one :reciepient, :class_name => "Users"


  attr_accessible :reciepient_email, :sender_id, :sent_at, :token
end
