require 'pry'

class Transfer
  
  attr_reader :transfer #initializes the transfer
  attr_accessor :sender, :receiver, :status, :amount # init sender, rcvr, status, and amt
  
  def initialize(sender, receiver, amount) # arguments for init
    @transfer = transfer 
    @sender = sender
    @receiver = receiver
    @status = "pending" 
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid? # sender and rcvr valid? true or false
  end
  
  def execute_transaction
     if @amount > sender.balance || @status == "complete" || valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @status != "complete" && valid?
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    end
  end
  
end
