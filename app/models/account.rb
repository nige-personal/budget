class Account < ApplicationRecord

    def self.accounts_for(account_ids)
      accounts = Account.where(id: account_ids)
      accounts.sort_by{|e| e[:id]}
    end
end
