class Account < ApplicationRecord
  belongs_to :user
  has_many :account_users
  has_many :transaction_headers

  accepts_nested_attributes_for :transaction_headers

    def self.accounts_for(account_ids)
      accounts = Account.where(id: account_ids)
      accounts.sort_by{|e| e[:id]}
    end
end
