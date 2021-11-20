class Wallet < ActiveRecord::Base
     belongs_to :user   
     has_many :bills

     def total_amount
        self.bills.sum('bill_amount')
     end
     
end
