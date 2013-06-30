class Loan < ActiveRecord::Base

  belongs_to :item

  belongs_to :owner,
    foreign_key: :owner_id,
    inverse_of: :loans

  validates_presence_of :item_id
  validates_presence_of :borrower_id
  validates_presence_of :owner_id
  validates_presence_of :state
















  attr_accessible :item_id, :borrower_id, :owner_id, :state
end
