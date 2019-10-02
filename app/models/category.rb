class Category < ApplicationRecord
  belongs_to :account
  belongs_to :group

  def self.for_account(account_id)
    Category.where(account_id: account_id)
  end
end
