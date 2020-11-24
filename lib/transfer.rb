require 'pry'

class Transfer
attr_accessor  :sender, :receiver, :status, :amount
def initialize(sender, receiver, amount)
  
  @sender = sender 
  @receiver = receiver
  @status = "pending"
  @amount = amount 
end

def valid?
  @sender.valid?
  @receiver.valid?
end

def execute_transaction 
  if @sender.valid? && @receiver.valid? && @amount > 0 && @sender.balance > @amount && self.status == "pending"
    @receiver.balance += amount  
    @sender.balance -= amount  
    # @amount -= @amount 
    @status = "complete"
else
  @status = "rejected"
  "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  # binding.pry
  if @receiver.valid? && @sender.valid? && @amount > 0  && @receiver.balance > @amount && self.status == "complete"
    @receiver.balance -= amount
    @sender.balance += amount 
    # @amount -= @amount 
    @status = "reversed"
  end
end

end
