class CreateTransactionHeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_headers do |t|
      t.references :user, foreign_key: true
      t.date :transaction_date
      t.references :account, foreign_key: true
      t.references :supplier, foreign_key: true
      t.string :sign
      t.date :reconciled
      t.decimal :total

      t.timestamps
    end
  end
end
