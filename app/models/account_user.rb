class AccountUser < ApplicationRecord
  belongs_to :account
  belongs_to :user

  def self.account_users_for(user_id)
    AccountUser.where(user: user_id)
  end

  def self.accounts_for(user_id)
    account_users = AccountUser.where(user: user_id)
    accounts_for_user = Account.where(id: account_users.map(&:id))
  end
end
