json.extract! transaction, :id, :user, :transaction_date, :account, :supplier, :sign, :reconciled, :total, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
