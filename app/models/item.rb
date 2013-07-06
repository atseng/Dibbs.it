class Item < ActiveRecord::Base

  belongs_to :user,
    foreign_key: :user_id,
    inverse_of: :items

  has_many :loans,
    dependent: :destroy

  validates_presence_of :category
  validates_presence_of :name
  validates_presence_of :activity

  mount_uploader :avatar, AvatarUploader

  def dibbs?
    loans.where(state: 'dibbs').present?
  end

  def dibbs_it
    loans.where(state: 'dibbs')
  end

  def loaned?
    loans.where(state: 'loaned').present?
  end

  def currently_loaned
    loans.where(state: 'loaned')
  end

  def returned?
    loans.where(state: 'returned').present?
  end

  def currently_returned
    loans.where(state: 'returned')
  end


  attr_accessible :avatar, :activity, :description, :category, :name, :user_id, :value
end
