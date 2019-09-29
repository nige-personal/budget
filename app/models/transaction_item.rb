class TransactionItem < ApplicationRecord
  belongs_to :category
  belongs_to :transaction_header
end
