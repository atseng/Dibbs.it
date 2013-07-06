class Invitation < ActiveRecord::Base
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
  has_one :reciepient, :class_name => "User", :foreign_key => "recipient_id"

  validates_presence_of :recipient_email
  validates_format_of :recipient_email, :with => /@/
  validate :recipient_is_not_registered
  validate :sender_has_invitations, :if => :sender

  before_create :generate_token
  before_create :decrement_sender_invite_count, :if => :sender

  attr_accessible :recipient_email, :sender_id, :sent_at, :token

  private

  def recipient_is_not_registered
    errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
  end

  def sender_has_invitations
    unless sender.invitation_limit > 0
      errors[:base] << "You have reached your friend invitation limit"
    end
  end

  def generate_token
    self.token = Digest::SHA1::hexdigest([Time.now, rand].join)
  end

  def decrement_sender_invite_count
    sender.decrement! :invitation_limit
  end



end
