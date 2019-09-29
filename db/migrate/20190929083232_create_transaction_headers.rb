class CreateTransactionHeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_headers do |t|
      t.integer :user
      t.date :transaction_date
      t.integer :account
      t.integer :supplier
      t.string :sign
      t.date :reconciled
      t.decimal :total

      t.timestamps
    end
  end
end
