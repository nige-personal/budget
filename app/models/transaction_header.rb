class TransactionHeader < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :supplier
  has_many :transaction_items

  accepts_nested_attributes_for :transaction_items
end
