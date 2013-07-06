class User < ActiveRecord::Base

  has_many :sent_invitations,
    :class_name => 'Invitation',
    :foreign_key => 'sender_id'

  belongs_to :invitation

  before_create :set_invitation_limit

  has_many :friendships,
    :dependent => :destroy

  has_many :requested_friends,
    :through => :friendships,
    :source => :friend,
    :conditions => "status = 'requested'",
    :order => :created_at

  has_many :friends,
    :through => :friendships,
    :conditions => "status = 'accepted'"

  has_many :pending_friends,
    :through => :friendships,
    :source => :friend,
    :conditions => "status = 'pending'",
    :order => :created_at

  phony_normalize :phone_number, :default_country_code => 'US'
  validates_presence_of :name
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :phone_number, :receives_notifications, :name, :email, :password, :password_confirmation, :remember_me, :friends, :friendships, :pending_friends
  # attr_accessible :title, :body

  has_many :items,
    :dependent => :destroy

  has_many :borrowers,
    :dependent => :destroy

  has_many :owners,
    :dependent => :destroy

  private

  def set_invitation_limit
    self.invitation_limit = 3
  end

end
