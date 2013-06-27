class Loan < ActiveRecord::Base
  attr_accessible :, :borrower_id, :owner_id, :state
end
