class AccountUser < ApplicationRecord
  belongs_to :account
  belongs_to :user

  def self.account_users_for(user_id)
    AccountUser.where(user: user_id)
  end
end
