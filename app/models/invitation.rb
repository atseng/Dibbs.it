class Invitation < ActiveRecord::Base
  attr_accessible :reciepient_email, :sender_id, :sent_at, :token
end
