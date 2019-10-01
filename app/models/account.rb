class Account < ApplicationRecord

    def self.accounts_for(user_id)
      accounts = []
      account_user = AccountUser.where(:user => user_id)
      account_user.each do |acc|
        accounts << Account.find(acc.account_id)
      end
      accounts.sort_by{|e| e[:id]}
    end
end
