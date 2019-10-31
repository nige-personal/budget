class Category < ApplicationRecord
  belongs_to :account

  def self.for_account(account_id)
    Category.where(account_id: account_id)
  end
end
