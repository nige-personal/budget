class Group < ApplicationRecord
  belongs_to :account

  def self.groups_for(account_id)
    Group.where(account_id: account_id)
  end
end
