class Loan < ActiveRecord::Base

  state_machine :state, :initial => :dibbs do

    event :loan do
      transition :dibbs => :loaned
    end

    event :return do
      transition :loaned => :returned
    end
  end


  belongs_to :item

  belongs_to :owner,
    :class_name => "User",
    foreign_key: :owner_id

  belongs_to :borrower,
    :class_name => "User",
    foreign_key: :borrower_id


  validates_presence_of :item_id
  validates_presence_of :borrower_id
  validates_presence_of :owner_id
  validates_presence_of :state

  attr_accessible :item_id, :borrower_id, :owner_id, :state
end
